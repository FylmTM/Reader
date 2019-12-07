import React, { useEffect } from 'react';
import { Route, Switch } from 'wouter';
import { Activity } from './components/common/Activity/Activity';
import { Container } from './components/Container';
import { Error } from './components/Error/Error';
import { LoginPage } from './components/pages/LoginPage';
import { NotFound } from './components/pages/NotFound';
import { PostsPage } from './components/pages/PostsPage';
import { ALL_ROUTE, CATEGORY_ROUTE, FEED_ROUTE } from './routes';
import { useApp, useUser } from './stores';

export const App = function App() {
    const { initialized, init } = useApp();
    const user = useUser();

    useEffect(() => {
        if (initialized === false) {
            init();
        }
    }, [initialized, init]);

    if (initialized === false) {
        return (
            <>
                <Error />
                <Activity inProgress={true} />
            </>
        );
    }

    if (user.current == null) {
        return (
            <>
                <Error />
                <LoginPage />
            </>
        );
    }

    const posts = <PostsPage />;
    return (
        <>
            <Error />
            <Container>
                <Switch>
                    <Route path={ALL_ROUTE}>{posts}</Route>
                    <Route path={CATEGORY_ROUTE}>{posts}</Route>
                    <Route path={FEED_ROUTE}>{posts}</Route>
                    <Route path="/:rest*"><NotFound /></Route>
                </Switch>
            </Container>
        </>
    );
};
