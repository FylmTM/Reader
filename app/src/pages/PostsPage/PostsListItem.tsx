import React, { FC } from "react";
import { IconButton } from "../../components/common/Button/Button";
import { NoStateLink } from "../../components/common/NoStateLink";
import { Post } from "../../domain";
import { classNames } from "../../utils";
import "./PostsListItem.css";

interface Props {
  post: Post;
  hrefPrefix: string;
  isSelected: boolean;
}

const MAX_SUMMARY_LENGTH = 150;

export const PostsListItem: FC<Props> = React.memo(function PostsListItem({
  post,
  hrefPrefix,
  isSelected
}) {
  let summary = post.summary;
  if (post.summary && post.summary?.length > MAX_SUMMARY_LENGTH) {
    summary = post.summary.substring(0, MAX_SUMMARY_LENGTH) + "...";
  }

  let isMediaImage = false;
  if (post.media && post.media.type.startsWith("image")) {
    isMediaImage = true;
  }

  const className = classNames("r-posts-list-item", {
    read: post.is_read,
    selected: isSelected
  });

  return (
    <NoStateLink
      href={post.link}
      className={className}
      onClickHref={`${hrefPrefix}/post/${post.id}`}
    >
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
              <IconButton icon="bookmark" look="minimal" size="small" />
              <IconButton icon="close" look="minimal" size="small" />
            </span>
          </div>
          {summary && <span className="summary">{summary}</span>}
          <span className="meta">
            <span className="date">{post.date}</span>
            <span>&nbsp;|&nbsp;</span>
            <span className="feed">
              <NoStateLink
                href={`/category/${post.feed.category_id}/feed/${post.feed.id}`}
                onClick={event => event.stopPropagation()}
              >
                {post.feed.title}
              </NoStateLink>
            </span>
          </span>
        </div>
      </div>
    </NoStateLink>
  );
});
