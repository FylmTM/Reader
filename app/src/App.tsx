import React, { useEffect } from 'react';
import { Activity } from './components/common/Activity/Activity';
import { Container } from './components/Container';
import { LoginPage } from './components/pages/LoginPage';
import { PostsPage } from './components/pages/PostsPage';
import { useApp, useUser } from './stores';

export const App = function App() {
    const {initialized, init} = useApp();
    const user = useUser();

    useEffect(() => {
        if (initialized === false) {
            init();
        }
    }, [initialized, init]);

    if (initialized === false) {
        return <Activity inProgress={true} />;
    }

    if (user.current == null) {
        return <LoginPage />;
    }

    return (
        <Container>
            <PostsPage />
        </Container>
    );
};
