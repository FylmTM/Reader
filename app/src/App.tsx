import { observer } from 'mobx-react-lite';
import React from 'react';
import { ApiRequestState } from "./components/ApiRequestState";
import { LoginPage } from "./components/pages/LoginPage";
import { PostsPage } from "./components/pages/PostsPage";
import { useCurrentUserStore } from "./stores";

export const App = observer(function App() {
    return (
        <div>
            <ApiRequestState/>
            <Page/>
        </div>
    );
});

const Page = observer(function App() {
    let currentUserStore = useCurrentUserStore();

    if (currentUserStore.currentUser == null) {
        return <LoginPage/>;
    } else {
        return <PostsPage/>;
    }
});
