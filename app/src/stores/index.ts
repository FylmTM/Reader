import create from "zustand";
import api from "../api";
import { navigate } from "../components/common/NoStateLink";
import {
  CategoriesWithFeeds,
  CategoriesWithFeedsUnreadCounts,
  Post,
  PostsSection,
  Section,
  User,
} from "../domain";
import { remove } from "../utils";

interface ErrorStore {
  error: string | undefined;
  clear: () => void;
}

export const [useError, errorStoreApi] = create<ErrorStore>(set => ({
  error: undefined,
  clear: () => set({ error: undefined }),
}));

function handleError(error: any) {
  console.error(error);
  errorStoreApi.setState({ error: error.toString() });
}

interface SectionStore {
  section?: Section;
}

export const [useSection, sectionStoreApi] = create<SectionStore>(set => ({
  section: undefined,
}));

export const usePostsSection: () => PostsSection = () =>
  useSection(({ section }) => {
    switch (section?.type) {
      case "read-later":
      case "all":
      case "category":
      case "feed":
        return section;
      default:
        throw Error("Section unexpectedly does not belong to posts subtype");
    }
  });

interface AppStore {
  initialized: boolean;
  refreshMark: number;
  init: () => void;
  refresh: () => void;
}

export const [useApp, appStoreApi] = create<AppStore>(set => ({
  initialized: false,
  refreshMark: 0,
  init: () => {
    api
      .getCurrentUser()
      .then(user => {
        userStoreApi.setState({ current: user });
      })
      .catch(() => {
        // Ignore any errors during init.
        // Most likely user is unauthorized.
      })
      .finally(() => set({ initialized: true }));
  },
  refresh: () => set(({ refreshMark }) => ({ refreshMark: refreshMark + 1 })),
}));

interface UserStore {
  current: User | undefined;
  loginInProgress: boolean;
  logoutInProgress: boolean;
  login: (apiKey: string) => void;
  logout: () => void;
}

export const [useUser, userStoreApi] = create<UserStore>(set => ({
  current: undefined,
  loginInProgress: false,
  logoutInProgress: false,
  login: apiKey => {
    set({ loginInProgress: true });
    api
      .login(apiKey)
      .then(user => set({ current: user }))
      .catch(handleError)
      .finally(() => set({ loginInProgress: false }));
  },
  logout: () => {
    set({ logoutInProgress: true });
    api
      .logout()
      .then(() => set({ current: undefined }))
      .catch(handleError)
      .finally(() => set({ logoutInProgress: false }));
  },
}));

export function useAuthenticatedUser(): { current: User } & UserStore {
  const { current, ...rest } = useUser();
  if (current == null) {
    throw new Error("User must be authenticated");
  }
  return { current, ...rest };
}

interface CategoriesStore {
  categories: CategoriesWithFeeds;
  unreadCounts: CategoriesWithFeedsUnreadCounts;
  categoriesGetInProgress: boolean;
  getCategories: () => void;
  getCategoriesUnreadCounts: () => void;
  decrementUnreadCount: (categoryId: number, feedId: number) => void;
  incrementUnreadCount: (categoryId: number, feedId: number) => void;
}

export const [useCategories, categoriesStoreApi] = create<CategoriesStore>(
  set => ({
    categories: [],
    unreadCounts: {
      categories: { all: undefined, read_later: undefined },
      feeds: {},
    },
    categoriesGetInProgress: false,
    getCategories: () => {
      set({ categoriesGetInProgress: true });
      api
        .getCategoriesWithFeeds()
        .then(categories => set({ categories }))
        .catch(handleError)
        .finally(() => set({ categoriesGetInProgress: false }));
    },
    getCategoriesUnreadCounts: () => {
      api
        .getCategoriesWithFeedsUnreadCounts()
        .then(unreadCounts => set({ unreadCounts }))
        .catch(handleError);
    },
    decrementUnreadCount: (categoryId, feedId) =>
      set(({ unreadCounts }) => {
        const all = unreadCounts.categories.all
          ? unreadCounts.categories.all - 1
          : 0;

        const categoryCurrentCount = unreadCounts.categories[categoryId];
        const category = categoryCurrentCount ? categoryCurrentCount - 1 : 0;

        const feedCurrentCount = unreadCounts.feeds[feedId];
        const feed = feedCurrentCount ? feedCurrentCount - 1 : 0;

        return {
          unreadCounts: {
            categories: {
              ...unreadCounts.categories,
              all,
              [categoryId]: category,
            },
            feeds: {
              ...unreadCounts.feeds,
              [feedId]: feed,
            },
          },
        };
      }),
    incrementUnreadCount: (categoryId, feedId) =>
      set(({ unreadCounts }) => {
        const all = (unreadCounts.categories.all || 0) + 1;
        const category = (unreadCounts.categories[categoryId] || 0) + 1;
        const feed = (unreadCounts.feeds[feedId] || 0) + 1;

        return {
          unreadCounts: {
            categories: {
              ...unreadCounts.categories,
              all,
              [categoryId]: category,
            },
            feeds: {
              ...unreadCounts.feeds,
              [feedId]: feed,
            },
          },
        };
      }),
  }),
);

interface PostsStore {
  posts: Array<Post>;
  postsGetInProgress: boolean;
  get: (section: PostsSection) => void;
  markAllAsRead: (section: PostsSection, href: string) => void;
  read: (postId: number, isRead: boolean) => void;
  readLater: (postId: number, isReadLater: boolean) => void;
  close: (postId: number, isSelected: boolean, hrefPrefix: string) => void;
}

export const [usePosts, postsStoreApi] = create<PostsStore>(set => ({
  posts: [],
  postsGetInProgress: false,
  get: section => {
    set({ posts: [], postsGetInProgress: true });
    api
      .getPosts(section)
      .then(posts => set({ posts }))
      .catch(handleError)
      .finally(() => set({ postsGetInProgress: false }));
  },
  markAllAsRead: (section, href) => {
    set(({ posts }) => {
      navigate(href);
      if (posts.length === 0) {
        appStoreApi.getState().refresh();
        return {};
      }

      const lastPostId = posts[0].id;
      api
        .markAllAsRead(section, lastPostId)
        .then(() => {
          appStoreApi.getState().refresh();
        })
        .catch(handleError);
      return { posts: [] };
    });
  },
  read: (postId, isRead) =>
    set(({ posts }) => {
      return {
        posts: posts.map(post => {
          if (post.id === postId && post.is_read !== isRead) {
            api.markAsRead(postId, isRead).catch(handleError);
            if (isRead) {
              categoriesStoreApi
                .getState()
                .decrementUnreadCount(post.category.id, post.feed.id);
            } else {
              categoriesStoreApi
                .getState()
                .incrementUnreadCount(post.category.id, post.feed.id);
            }
            return { ...post, is_read: isRead };
          } else {
            return post;
          }
        }),
      };
    }),
  readLater: (postId, isReadLater) =>
    set(({ posts }) => {
      return {
        posts: posts.map(post => {
          if (post.id === postId && post.is_read_later !== isReadLater) {
            api.markAsReadLater(postId, isReadLater).catch(handleError);
            return { ...post, is_read_later: isReadLater };
          } else {
            return post;
          }
        }),
      };
    }),
  close: (postId, isSelected, hrefPrefix) => {
    set(({ posts, read }) => {
      const i = posts.findIndex(post => post.id === postId);
      if (i === -1) {
        return {};
      }

      read(posts[i].id, true);

      if (isSelected) {
        let nextPostIndex: number | undefined = undefined;

        if (i < posts.length - 1) {
          nextPostIndex = i + 1;
        } else if (i > 0) {
          nextPostIndex = i - 1;
        }

        if (nextPostIndex == null) {
          navigate(hrefPrefix);
        } else {
          navigate(`${hrefPrefix}/post/${posts[nextPostIndex].id}`);
        }
      }

      return {
        posts: remove(posts, i),
      };
    });
  },
}));
