import React, { useEffect } from "react";
import { Redirect, Route, Switch } from "wouter";
import { Activity } from "./components/common/Activity/Activity";
import { Container } from "./components/Container";
import { Error } from "./components/Error/Error";
import { LoginPage } from "./pages/LoginPage";
import { NotFound } from "./pages/NotFound";
import { PostsPage } from "./pages/PostsPage";
import {
  ALL_ROUTE,
  CATEGORY_ROUTE,
  FEED_ROUTE,
  READ_LATER_ROUTE
} from "./routes";
import { sectionStoreApi, useApp, useUser } from "./stores";

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

  return <Routes />;
};

function Routes() {
  return (
    <>
      <Error />
      <Container>
        <Switch>
          <Route path={READ_LATER_ROUTE}>
            {params => {
              sectionStoreApi.setState({ section: { type: "read-later" } });
              return <PostsPage />;
            }}
          </Route>
          <Route path={ALL_ROUTE}>
            {params => {
              sectionStoreApi.setState({ section: { type: "all" } });
              return <PostsPage />;
            }}
          </Route>
          <Route<{ categoryId: string }> path={CATEGORY_ROUTE}>
            {params => {
              const categoryId = parseInt(params.categoryId);
              sectionStoreApi.setState({
                section: { type: "category", categoryId }
              });
              return <PostsPage />;
            }}
          </Route>
          <Route<{ feedId: string }> path={FEED_ROUTE}>
            {params => {
              const feedId = parseInt(params.feedId);
              sectionStoreApi.setState({ section: { type: "feed", feedId } });
              return <PostsPage />;
            }}
          </Route>
          <Route path="/">
            <Redirect to={ALL_ROUTE} />
          </Route>
          <Route path="/:rest*">
            {() => {
              sectionStoreApi.setState({ section: { type: "not-found" } });
              return <NotFound />;
            }}
          </Route>
        </Switch>
      </Container>
    </>
  );
}
