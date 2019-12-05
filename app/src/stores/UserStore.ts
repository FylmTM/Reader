import { decorate, observable } from 'mobx/lib/mobx.es6.js';
import { User } from '../domain';
import { ApiStore } from './ApiStore';
import { PostsStore } from './PostsStore';

export class UserStore {
    apiStore: ApiStore;
    postsStore: PostsStore;

    authenticatedUser: User | undefined;
    inProgress: { login: boolean, logout: boolean };

    constructor(apiStore: ApiStore, postsStore: PostsStore) {
        this.apiStore = apiStore;
        this.postsStore = postsStore;
        this.inProgress = {
            login: false,
            logout: false,
        };
        this.login();
    }

    get user(): User {
        if (this.authenticatedUser == null) {
            throw new Error("User is unexpectedly not authenticated");
        }
        return this.authenticatedUser;
    }

    login = () => {
        this.inProgress.login = true;
        this.apiStore.login(
            (user) => {
                this.authenticatedUser = user;
            },
            () => {
                this.inProgress.login = false;
            },
        );
    };

    logout = () => {
        this.inProgress.logout = true;
        this.apiStore.logout(
            () => {
                this.authenticatedUser = undefined;
            },
            () => {
                this.inProgress.logout = false;
                this.postsStore.clean();
            },
        );
    };
}

decorate(UserStore, {
    authenticatedUser: observable,
    inProgress: observable,
});
