import { decorate, IObservableArray, observable } from 'mobx/lib/mobx.es6.js';
import { Category, Post } from '../domain';
import { RootStore } from './index';

export class PostsStore {
    rootStore: RootStore;

    currentCategory: Category | undefined;
    categories: IObservableArray<Category> = observable.array();
    posts: IObservableArray<Post> = observable.array();

    constructor(rootStore: RootStore) {
        this.rootStore = rootStore;
        this.categories.replace([
            {
                id: 1,
                name: 'all',
            },
            {
                id: 2,
                name: 'programming',
            },
        ]);
    }

    clean = () => {
        this.posts.clear();
        this.currentCategory = undefined;
    };

    changeCategory = (category: Category) => {
        this.currentCategory = category;
    };
}

decorate(PostsStore, {
    currentCategory: observable,
    categories: observable,
    posts: observable,
});
