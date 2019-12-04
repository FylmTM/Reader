import {observer} from 'mobx-react-lite';
import React from 'react';
import { Category, Post } from "../../domain";
import { useRootStore } from "../../stores";

export const PostsPage = observer(function PostsPage() {
    const { postsStore, currentUserStore } = useRootStore();
    return (
        <div>
            <button
                onClick={currentUserStore.logout}
                disabled={currentUserStore.inProgress.logout}
            >
                Logout
            </button>
            <h1>Categories</h1>
            {postsStore.categories.map((category: Category) => (
                <div key={category.id}>
                    <button onClick={() => postsStore.currentCategory = category}>{category.name}</button>
                    <br/>
                </div>
            ))}
            <br/>
            Current category: {postsStore.currentCategory ? postsStore.currentCategory.name : "no category"}
            <br/>
            Current posts: {postsStore.posts.length}
            <br/>
            {postsStore.posts.map((post: Post, i: number) =>
                (<div key={i}>{post.title}</div>)
            )}
            <button onClick={postsStore.addPost}>Add post</button>
        </div>
    );
});
