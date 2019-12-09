/* eslint-disable react-hooks/exhaustive-deps */
import React, { FC, useEffect } from "react";
import { Activity } from "../../components/common/Activity/Activity";
import { IconButton } from "../../components/common/Button/Button";
import { navigate } from "../../components/common/NoStateLink";
import * as domain from "../../domain";
import { useApp, useCategories, usePosts, usePostsSection } from "../../stores";
import { Post } from "./Post";
import { PostsList } from "./PostsList";
import "./PostsPage.css";

function itemData(
  section: domain.PostsSection,
): { hrefPrefix: string; postId: number | undefined } {
  switch (section.type) {
    case "read-later":
      return {
        hrefPrefix: "/read-later",
        postId: section.postId,
      };
    case "all":
      return {
        hrefPrefix: "/all",
        postId: section.postId,
      };
    case "category":
      return {
        hrefPrefix: `/category/${section.categoryId}`,
        postId: section.postId,
      };
    case "feed":
      return {
        hrefPrefix: `/category/${section.categoryId}/feed/${section.feedId}`,
        postId: section.postId,
      };
  }
}

export const PostsPage: FC = function PostsPage() {
  const section = usePostsSection();
  const posts = usePosts();
  const refreshMark = useApp(state => state.refreshMark);
  const getUnreadCounts = useCategories(
    state => state.getCategoriesUnreadCounts,
  );

  const type = section.type;
  let categoryId: number | undefined = undefined;
  let feedId: number | undefined = undefined;

  const title = useCategories(({ categories }) => {
    switch (section.type) {
      case "read-later":
        return "Read later";
      case "all":
        return "All";
      case "category":
        categoryId = section.categoryId;
        const category = categories.find(
          ({ category }) => category.id === section.categoryId,
        );
        return category?.category.name;
      case "feed":
        categoryId = section.categoryId;
        feedId = section.feedId;
        const categoryWithFeeds = categories.find(
          ({ category }) => category.id === section.categoryId,
        );
        if (categoryWithFeeds == null) {
          return "";
        }
        const feed = categoryWithFeeds.feeds.find(
          feed => feed.id === section.feedId,
        );
        return feed?.title;
    }
  });

  const { hrefPrefix, postId } = itemData(section);

  useEffect(() => {
    if (section) {
      getUnreadCounts();
      posts.get(section);
    }
  }, [refreshMark, type, categoryId, feedId]);

  useEffect(() => {
    if (postId) {
      posts.read(postId, true);
    }
  }, [postId]);

  const post = posts.posts.find(post => post.id === postId);
  if (postId != null && post == null) {
    navigate(hrefPrefix);
  }

  return (
    <div className="r-page-posts">
      <div className="r-posts-list">
        <div className="r-page-posts-list-navbar">
          <div className="left">
            <span className="r-title ellipsis">
              <span className="ellipsis">{title}</span>
            </span>
          </div>
          <div className="right">
            <IconButton
              icon="check"
              look="outline"
              onClick={() => {
                posts.markAllAsRead(section, hrefPrefix);
              }}
            />
          </div>
        </div>
        <div className="r-posts-list-content">
          <Activity inProgress={posts.postsGetInProgress}>
            <PostsList
              posts={posts.posts}
              postId={postId}
              hrefPrefix={hrefPrefix}
            />
          </Activity>
        </div>
      </div>
      <Post postId={postId} hrefPrefix={hrefPrefix} />
    </div>
  );
};
