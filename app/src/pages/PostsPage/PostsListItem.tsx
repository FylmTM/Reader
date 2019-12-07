import React, { FC, MouseEventHandler } from "react";
import { Link } from "wouter";
import { Button } from "../../components/common/Button/Button";
import { Post } from "../../domain";
import { useSection } from "../../stores";
import "./PostsListItem.css";

interface Props {
  post: Post;
}

const MAX_SUMMARY_LENGTH = 150;

export const PostsListItem: FC<Props> = function PostsListItem({ post }) {
  const { hrefPrefix, isSelected } = useSection(({ section }) => {
    switch (section?.type) {
      case "read-later":
        return {
          hrefPrefix: "/read-later",
          isSelected: section.postId === post.id
        };
      case "all":
        return {
          hrefPrefix: "/all",
          isSelected: section.postId === post.id
        };
      case "category":
        return {
          hrefPrefix: `/category/${section.categoryId}`,
          isSelected: section.postId === post.id
        };
      case "feed":
        return {
          hrefPrefix: `/category/${section.categoryId}/feed/${section.feedId}`,
          isSelected: section.postId === post.id
        };
      default:
        return {
          hrefPrefix: "",
          isSelected: false
        };
    }
  });

  let summary = post.summary;
  if (post.summary && post.summary?.length > MAX_SUMMARY_LENGTH) {
    summary = post.summary.substring(0, MAX_SUMMARY_LENGTH) + "...";
  }

  let isMediaImage = false;
  if (post.media && post.media.type.startsWith("image")) {
    isMediaImage = true;
  }

  const select: MouseEventHandler = event => {
    if (
      event.ctrlKey ||
      event.metaKey ||
      event.altKey ||
      event.shiftKey ||
      event.button !== 0
    ) {
      return;
    }
    event.preventDefault();
    event.stopPropagation();
    // eslint-disable-next-line no-restricted-globals
    history.pushState({}, "", `${hrefPrefix}/post/${post.id}`);
  };

  const className = [
    "r-posts-list-item",
    post.is_read ? "read" : "",
    isSelected ? "selected" : ""
  ].join(" ");

  return (
    <a href={post.link} className={className} onClick={select}>
      <div className="border">
        {isMediaImage && (
          <div className="media">
            <img src={post.media?.link} alt="" />
          </div>
        )}
        <div className="text">
          <div className="title-row">
            <span className="title">{post.title}</span>
            <span className="actions">
              <Button icon="bookmark" look="minimal" size="small" />
              <Button icon="close" look="minimal" size="small" />
            </span>
          </div>
          {summary && <span className="summary">{summary}</span>}
          <span className="meta">
            <span className="date">{post.date}</span>
            <span>&nbsp;|&nbsp;</span>
            <span className="feed">
              <Link
                href={`/category/${post.feed.category_id}/feed/${post.feed.id}`}
              >
                {post.feed.title}
              </Link>
            </span>
          </span>
        </div>
      </div>
    </a>
  );
};
