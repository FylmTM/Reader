import { decorate, IObservableArray, observable } from 'mobx/lib/mobx.es6.js';
import { Category, Post } from '../domain';
import { ApiStore } from './ApiStore';

export class PostsStore {
    apiStore: ApiStore;

    currentCategory: Category | undefined;
    categories: IObservableArray<Category> = observable.array();
    posts: IObservableArray<Post> = observable.array();

    constructor(apiStore: ApiStore) {
        this.apiStore = apiStore;
    }

    clean = () => {
        this.posts.clear();
    };
}

decorate(PostsStore, {
    currentCategory: observable,
    categories: observable,
    posts: observable,
});
