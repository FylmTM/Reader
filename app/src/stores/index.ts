import create from "zustand";
import api from "../api";
import { CategoriesWithFeeds, User } from "../domain";

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

export const [useCategories] = create<CategoriesStore>(set => ({
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
}));
