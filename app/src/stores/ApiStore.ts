import { computed, decorate, observable } from "mobx/lib/mobx.es6.js";
import api from '../api';
import { User } from "../domain";
import { RootStore } from "./index";

export class ApiStore {
    rootStore: RootStore;

    currentRequestsCount: number;

    constructor(rootStore: RootStore) {
        this.rootStore = rootStore;
        this.currentRequestsCount = 0;
    }

    get isRequestInProgress(): boolean {
        return this.currentRequestsCount > 0;
    };

    beginApiRequest = () => {
        this.currentRequestsCount++;
    };

    endApiRequest = () => {
        this.currentRequestsCount--;
    };

    login = (onSuccess: (user: User) => void, onFinished: () => void = () => {}) => {
        this.beginApiRequest();
        api.login()
            .then(onSuccess)
            .catch(this.handleError)
            .finally(() => {
                onFinished && onFinished();
                this.endApiRequest();
            });
    };

    logout = (onSuccess: () => void, onFinished: () => void = () => {}) => {
        this.beginApiRequest();
        api.logout()
            .then(onSuccess)
            .catch(this.handleError)
            .finally(() => {
                onFinished && onFinished();
                this.endApiRequest();
            })
    };

    handleError = (error: any) => {
        console.error(error);
    }
}

decorate(ApiStore, {
    currentRequestsCount: observable,
    isRequestInProgress: computed,
});
