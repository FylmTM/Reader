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
      .then(user => userStoreApi.setState({ current: user }))
      .catch(handleError)
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
  }),
);

interface PostsStore {
  posts: Array<Post>;
  postsGetInProgress: boolean;
  get: (section: PostsSection) => void;
  markAllAsRead: (section: PostsSection) => void;
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
  markAllAsRead: section => {
    set(({ posts }) => {
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

      if (posts[i].is_read === false) {
        api.markAsRead(postId, true).catch(handleError);
      }

      let nextPostIndex: number | undefined = undefined;
      if (isSelected) {
        if (i < posts.length - 1) {
          nextPostIndex = i + 1;
        } else if (i > 0) {
          nextPostIndex = i - 1;
        }
      }

      if (nextPostIndex == null) {
        navigate(`${hrefPrefix}`);
      } else {
        const nextPost = posts[nextPostIndex];
        read(nextPost.id, true);
        navigate(`${hrefPrefix}/post/${nextPost.id}`);
      }

      return {
        posts: remove(posts, i),
      };
    });
  },
}));
