import create from "zustand";
import api from "../api";
import { navigate } from "../components/common/NoStateLink";
import { CategoriesWithFeeds, Post, Section, User } from "../domain";

function remove(array: any[], index: number) {
  return [...array.slice(0, index), ...array.slice(index + 1)];
}

interface ErrorStore {
  error: string | undefined;
  clear: () => void;
}

export const [useError, errorStoreApi] = create<ErrorStore>(set => ({
  error: undefined,
  clear: () => set({ error: undefined })
}));

function handleError(error: any) {
  console.log(error);
  errorStoreApi.setState({ error: error.toString() });
}

interface SectionStore {
  section?: Section;
}

export const [useSection, sectionStoreApi] = create<SectionStore>(set => ({
  section: undefined
}));

interface AppStore {
  initialized: boolean;
  init: () => void;
}

export const [useApp] = create<AppStore>(set => ({
  initialized: false,
  init: () => {
    api
      .getCurrentUser()
      .then(user => userStoreApi.setState({ current: user }))
      .catch(handleError)
      .finally(() => set({ initialized: true }));
  }
}));

interface UserStore {
  current: User | undefined;
  loginInProgress: boolean;
  logoutInProgress: boolean;
  login: () => void;
  logout: () => void;
}

export const [useUser, userStoreApi] = create<UserStore>(set => ({
  current: undefined,
  loginInProgress: false,
  logoutInProgress: false,
  login: () => {
    set({ loginInProgress: true });
    api
      .login()
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
  }
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
  categoriesGetInProgress: boolean;
  getCategories: () => void;
}

export const [useCategories, categoriesStoreApi] = create<CategoriesStore>(
  set => ({
    categories: [],
    categoriesGetInProgress: false,
    getCategories: () => {
      set({ categoriesGetInProgress: true });
      api
        .getCategoriesWithFeeds()
        .then(categories => set({ categories }))
        .catch(handleError)
        .finally(() => set({ categoriesGetInProgress: false }));
    }
  })
);

interface PostsStore {
  posts: Array<Post>;
  postsGetInProgress: boolean;
  get: (section: Section) => void;
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
      .getPosts()
      .then(posts => set({ posts }))
      .catch(handleError)
      .finally(() => set({ postsGetInProgress: false }));
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
        })
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
        })
      };
    }),
  close: (postId, isSelected, hrefPrefix) => {
    set(({ posts }) => {
      const i = posts.findIndex(post => post.id === postId);
      if (i === -1) {
        return {};
      }

      const post = posts[i];
      if (post.is_read === false) {
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

      if (nextPostIndex != null) {
        navigate(`${hrefPrefix}/post/${posts[nextPostIndex].id}`);
      } else {
        navigate(`${hrefPrefix}`);
      }

      return {
        posts: remove(
          posts.map((post, i) => {
            if (i === nextPostIndex && post.is_read === false) {
              api.markAsRead(post.id, true).catch(handleError);
              return { ...post, is_read: true };
            } else {
              return post;
            }
          }),
          i
        )
      };
    });
  }
}));
