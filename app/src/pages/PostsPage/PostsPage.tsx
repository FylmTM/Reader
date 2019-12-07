import React, { FC, useEffect } from "react";
import { Activity } from "../../components/common/Activity/Activity";
import { Button } from "../../components/common/Button/Button";
import { useCategories, usePosts, useSection } from "../../stores";
import "./PostsPage.css";
import { PostsListItem } from "./PostsListItem";

export const PostsPage: FC = function PostsPage() {
  const section = useSection(state => state.section);
  const type = section?.type;
  let categoryId: number | undefined;
  let feedId: number | undefined;

  const title = useCategories(({ categories }) => {
    switch (section?.type) {
      case "read-later":
        return "Read later";
      case "all":
        return "All";
      case "category":
        categoryId = section.categoryId;
        const category = categories.find(
          ({ category }) => category.id === section.categoryId
        );
        return category?.category.name;
      case "feed":
        categoryId = section.categoryId;
        feedId = section.feedId;
        const categoryWithFeeds = categories.find(
          ({ category }) => category.id === section.categoryId
        );
        if (categoryWithFeeds == null) {
          return "";
        }
        const feed = categoryWithFeeds.feeds.find(
          feed => feed.id === section.feedId
        );
        return feed?.title;
      default:
        return "";
    }
  });

  const { posts, postsGetInProgress, get: getPosts } = usePosts();

  useEffect(() => {
    if (section) {
      getPosts(section);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [type, categoryId, feedId]);

  return (
    <div className="r-page-posts">
      <div className="r-posts-list">
        <div className="r-page-posts-list-navbar">
          <div className="left">
            <span className="r-title">{title}</span>
          </div>
          <div className="right">
            <Button icon="check" look="outline" />
          </div>
        </div>
        <div className="r-posts-list-content">
          <Activity inProgress={postsGetInProgress}>
            {posts.map(post => (
              <PostsListItem key={post.id} post={post} />
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
