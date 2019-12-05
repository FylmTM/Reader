import React from 'react';
import { Container } from './components/Container';
import { LoginPage } from './components/pages/LoginPage';
import { PostsPage } from './components/pages/PostsPage';
import { useUser } from './stores';

export const App = function App() {
    let user = useUser();
    if (user.current == null) {
        return <LoginPage />;
    }

    return (
        <Container>
            <PostsPage />
        </Container>
    );
};
