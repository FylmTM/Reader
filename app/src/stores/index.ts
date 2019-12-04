import React from 'react';
import { ApiStore } from "./ApiStore";
import { CurrentUserStore } from "./CurrentUserStore";
import { PostsStore } from "./PostsStore";
import { UiStore } from "./UiStore";

export class RootStore {
    apiStore: ApiStore;
    uiStore: UiStore;
    currentUserStore: CurrentUserStore;
    postsStore: PostsStore;

    constructor() {
        this.apiStore = new ApiStore(this);
        this.uiStore = new UiStore(this);
        this.currentUserStore = new CurrentUserStore(this);
        this.postsStore = new PostsStore(this);
    }
}

export const rootStoreContext = React.createContext({
    rootStore: new RootStore(),
});

export const useRootStore = () => React.useContext(rootStoreContext).rootStore;
export const useApiStore = () => React.useContext(rootStoreContext).rootStore.apiStore;
export const useUiStore = () => React.useContext(rootStoreContext).rootStore.uiStore;
export const useCurrentUserStore = () => React.useContext(rootStoreContext).rootStore.currentUserStore;
export const usePostsStore = () => React.useContext(rootStoreContext).rootStore.postsStore;
