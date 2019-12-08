import React, { FC, useEffect } from "react";
import { Activity } from "../../components/common/Activity/Activity";
import { IconButton } from "../../components/common/Button/Button";
import { PostsSection } from "../../domain";
import { useApp, useCategories, usePosts, usePostsSection } from "../../stores";
import { PostsListItem } from "./PostsListItem";
import "./PostsPage.css";

function itemData(
  section: PostsSection,
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
      posts.get(section);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [refreshMark, type, categoryId, feedId]);

  useEffect(() => {
    if (postId) {
      posts.read(postId, true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [postId]);

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
                posts.markAllAsRead(section);
              }}
            />
          </div>
        </div>
        <div className="r-posts-list-content">
          <Activity inProgress={posts.postsGetInProgress}>
            {posts.posts.map(post => (
              <PostsListItem
                key={post.id}
                post={post}
                hrefPrefix={hrefPrefix}
                isSelected={postId ? postId === post.id : false}
              />
            ))}
          </Activity>
        </div>
      </div>
      <div className="r-post">
        <div className="r-page-post-navbar">
          <div className="left" />
          <div className="right" />
        </div>
      </div>
    </div>
  );
};
