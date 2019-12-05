import React from 'react';
import { ApiStore } from './ApiStore';
import { PostsStore } from './PostsStore';
import { UserStore } from './UserStore';

const apiStore = new ApiStore();
const postsStore = new PostsStore(apiStore);
const userStore = new UserStore(apiStore, postsStore);

export const rootStoreContext = React.createContext({
    apiStore,
    postsStore,
    userStore,
});

export const useRootStore = () => React.useContext(rootStoreContext);
export const useApiStore = () => React.useContext(rootStoreContext).apiStore;
export const useUserStore = () => React.useContext(rootStoreContext).userStore;
export const usePostsStore = () => React.useContext(rootStoreContext).postsStore;
