import React from "react";
import { Redirect, Route, Switch } from "wouter";
import { Container } from "./components/Container";
import { Error } from "./components/Error/Error";
import { NotFound } from "./pages/NotFound/NotFound";
import { PostsPage } from "./pages/PostsPage/PostsPage";
import { sectionStoreApi } from "./stores";

export function Routes() {
  return (
    <>
      <Error />
      <Container>
        <Switch>
          <Route path="/read-later">
            {params => {
              sectionStoreApi.setState({ section: { type: "read-later" } });
              return <PostsPage />;
            }}
          </Route>
          <Route path="/all">
            {params => {
              sectionStoreApi.setState({ section: { type: "all" } });
              return <PostsPage />;
            }}
          </Route>
          <Route<{ categoryId: string }> path="/category/:categoryId">
            {params => {
              const categoryId = parseInt(params.categoryId);
              sectionStoreApi.setState({
                section: { type: "category", categoryId }
              });
              return <PostsPage />;
            }}
          </Route>
          <Route<{
            categoryId: string;
            postId: string;
          }> path="/category/:categoryId/post/:postId">
            {params => {
              const categoryId = parseInt(params.categoryId);
              const postId = parseInt(params.postId);
              sectionStoreApi.setState({
                section: { type: "category", categoryId, postId }
              });
              return <PostsPage />;
            }}
          </Route>
          <Route<{
            categoryId: string;
            feedId: string;
          }> path="/category/:categoryId/feed/:feedId">
            {params => {
              const categoryId = parseInt(params.categoryId);
              const feedId = parseInt(params.feedId);
              sectionStoreApi.setState({
                section: { type: "feed", feedId, categoryId }
              });
              return <PostsPage />;
            }}
          </Route>
          <Route path="/">
            <Redirect to="/all" />
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
