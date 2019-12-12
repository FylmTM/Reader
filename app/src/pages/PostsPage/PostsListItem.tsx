import React, { FC } from "react";
import { IconButton } from "../../components/common/Button/Button";
import { Icon } from "../../components/common/Icon/Icon";
import { NoStateLink } from "../../components/common/NoStateLink";
import { Post } from "../../domain";
import { postsStoreApi } from "../../stores";
import { classNames } from "../../utils";
import "./PostsListItem.css";
import formatDistanceToNow from "date-fns/formatDistanceToNow";
import parseISO from "date-fns/parseISO";

interface Props {
  post: Post;
  hrefPrefix: string;
  isSelected: boolean;
}

const MAX_SUMMARY_LENGTH = 300;

export const PostsListItem: FC<Props> = React.memo(function PostsListItem({
  post,
  hrefPrefix,
  isSelected,
}) {
  const { read, readLater, close } = postsStoreApi.getState();
  let summary = post.summary;
  if (summary && summary?.length > MAX_SUMMARY_LENGTH) {
    summary = summary.substring(0, MAX_SUMMARY_LENGTH) + "...";
  }

  let isMediaImage = false;
  if (
    post.media_type != null &&
    post.media_link != null &&
    post.media_type.startsWith("image")
  ) {
    isMediaImage = true;
  }

  const className = classNames("r-posts-list-item", {
    read: post.is_read,
    selected: isSelected,
    "read-later": post.is_read_later,
  });

  const onClickHref = isSelected ? hrefPrefix : `${hrefPrefix}/post/${post.id}`;
  const since = formatDistanceToNow(parseISO(post.date));

  return (
    <div className={className}>
      <span className="meta">
        <span className="date">{since}</span>
        <span>&nbsp;\&nbsp;</span>
        <span className="feed">
          <NoStateLink
            href={`/category/${post.category_id}/feed/${post.feed_id}`}
            onClick={event => event.stopPropagation()}
          >
            {post.feed_title}
          </NoStateLink>
        </span>
      </span>
      <span className="actions">
        {post.comments_link && (
          <a
            href={post.comments_link}
            target="_blank"
            rel="noopener noreferrer"
            className="r-button minimal"
          >
            <Icon type="message" size="small" />
          </a>
        )}
        <IconButton
          className="read-later"
          icon="bookmark"
          look="minimal"
          size="small"
          tabIndex={-1}
          onClick={event => {
            event.preventDefault();
            event.stopPropagation();
            readLater(post.id, !post.is_read_later);
          }}
        />
        <IconButton
          className="read"
          icon="check"
          look="minimal"
          size="small"
          tabIndex={-1}
          onClick={event => {
            event.preventDefault();
            event.stopPropagation();
            read(post.id, !post.is_read);
          }}
        />
        <IconButton
          icon="close"
          look="minimal"
          size="small"
          tabIndex={-1}
          onClick={event => {
            event.preventDefault();
            event.stopPropagation();
            close(post.id, isSelected, hrefPrefix);
          }}
        />
      </span>
      <NoStateLink href={post.link} onClickHref={onClickHref}>
        <div className="border">
          {isMediaImage && (
            <div className="media">
              <img src={post.media_link} alt="" />
            </div>
          )}
          <div className="text">
            <span className="title">{post.title}</span>
            {summary && <span className="summary">{summary}</span>}
          </div>
        </div>
        <div className="fade" />
      </NoStateLink>
    </div>
  );
});
