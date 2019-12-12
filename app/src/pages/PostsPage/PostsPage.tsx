/* eslint-disable react-hooks/exhaustive-deps */
import React, { FC, useEffect } from "react";
import { navigate } from "../../components/common/NoStateLink";
import { Navbar } from "../../components/Navbar/Navbar";
import * as domain from "../../domain";
import { useLocalStorage } from "../../hooks/useLocalStorage";
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
  const [isUnreadOnly, setIsUnreadOnly] = useLocalStorage(
    "posts-list-unread-only",
    true,
  );

  // Extract section data into individual variables for hook.
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
        return category?.category.title;
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

  const { hrefPrefix, postId: selectedPostId } = itemData(section);

  // Whenever section is changed, load first page of posts
  useEffect(() => {
    if (section) {
      getUnreadCounts();
      posts.get(section, isUnreadOnly);
    }
  }, [refreshMark, type, categoryId, feedId, isUnreadOnly]);

  useEffect(() => {
    if (selectedPostId) {
      // Mark post as read, when it's selected
      posts.read(selectedPostId, true);

      // If there is post selected, but such post does not exists, deselect it.
      const post = posts.posts.find(post => post.id === selectedPostId);
      if (post == null) {
        navigate(hrefPrefix);
      }
    }
  }, [selectedPostId]);

  return (
    <div className="r-page-posts">
      <div className="r-posts-list">
        <Navbar>
          <div className="left">
            <span className="r-title ellipsis">
              <span className="ellipsis">{title}</span>
            </span>
          </div>
          <div className="right">
            <div className="r-posts-list-action-unread-only">
              <input
                type="checkbox"
                checked={isUnreadOnly}
                onChange={() => setIsUnreadOnly(!isUnreadOnly)}
              />
              Unread only
            </div>
          </div>
        </Navbar>
        <div className="r-posts-list-content">
          <PostsList
            selectedPostId={selectedPostId}
            hrefPrefix={hrefPrefix}
            section={section}
            isUnreadOnly={isUnreadOnly}
          />
        </div>
      </div>
      <Post postId={selectedPostId} hrefPrefix={hrefPrefix} />
    </div>
  );
};
