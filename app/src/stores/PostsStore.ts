import { decorate, IObservableArray, observable } from 'mobx/lib/mobx.es6.js';
import { Category, Post } from '../domain';
import { RootStore } from "./index";

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
                name: "all",
            },
            {
                id: 2,
                name: "programming",
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

    addPost = () => {
        this.posts.push({
            id: 0,
            link: "link",
            title: "title",
            date: "date",
            content: undefined,
            media_type: undefined,
            media_link: undefined,
            comments_link: undefined,
        });
    };
}

decorate(PostsStore, {
    currentCategory: observable,
    categories: observable,
    posts: observable,
});
