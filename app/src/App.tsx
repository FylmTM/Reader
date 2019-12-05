import { observer } from 'mobx-react-lite';
import React from 'react';
import { Container } from './components/Container';
import { LoginPage } from './components/pages/LoginPage';
import { PostsPage } from './components/pages/PostsPage';
import { useCurrentUserStore } from './stores';

export const App = observer(function App() {
    let currentUserStore = useCurrentUserStore();
    if (currentUserStore.currentUser == null) {
        return <LoginPage />;
    }

    return (
        <Container>
            <PostsPage />
        </Container>
    );
});
