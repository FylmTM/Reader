import { decorate, observable } from 'mobx/lib/mobx.es6.js';
import { User } from '../domain';
import { RootStore } from "./index";

export class CurrentUserStore {
    rootStore: RootStore;

    currentUser: User | undefined;
    inProgress: { login: boolean, logout: boolean };

    constructor(rootStore: RootStore) {
        this.rootStore = rootStore;
        this.inProgress = {
            login: false,
            logout: false,
        };
    }

    login = () => {
        this.inProgress.login = true;
        this.rootStore.apiStore.login(
            (user) => {
                this.currentUser = user;
            },
            () => {
                this.inProgress.login = false;
            }
        );
    };

    logout = () => {
        this.inProgress.logout = true;
        this.rootStore.apiStore.logout(
            () => {
                this.currentUser = undefined;
            },
            () => {
                this.inProgress.logout = false;
                this.rootStore.postsStore.clean();
            }
        );
    };
}

decorate(CurrentUserStore, {
    currentUser: observable,
    inProgress: observable,
});
