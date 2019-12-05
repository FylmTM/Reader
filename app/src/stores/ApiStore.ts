import { decorate } from 'mobx/lib/mobx.es6.js';
import api from '../api';
import { User } from '../domain';

export class ApiStore {

    login = (onSuccess: (user: User) => void, onFinished: () => void = () => undefined) => {
        api.login()
            .then(onSuccess)
            .catch(this.handleError)
            .finally(() => {
                onFinished && onFinished();
            });
    };

    logout = (onSuccess: () => void, onFinished: () => void = () => undefined) => {
        api.logout()
            .then(onSuccess)
            .catch(this.handleError)
            .finally(() => {
                onFinished && onFinished();
            });
    };

    handleError = (error: any) => {
        console.error(error);
    }
}

decorate(ApiStore, {});
