import React, { FC, useEffect, useRef } from "react";
import { IconButton } from "../../components/common/Button/Button";
import { Icon } from "../../components/common/Icon/Icon";
import { NoStateLink } from "../../components/common/NoStateLink";
import { usePosts } from "../../stores";
import { classNames } from "../../utils";
import "./Post.css";

const NoPost: FC = function NoPost() {
  return (
    <div className="r-post">
      <div className="r-page-post-navbar">
        <div className="left" />
        <div className="right" />
      </div>
    </div>
  );
};

interface Props {
  postId: number | undefined;
  hrefPrefix: string;
}

export const Post: FC<Props> = function Post({ postId, hrefPrefix }) {
  const contentRef = useRef(null);
  const { posts, read, readLater, close } = usePosts();
  const post = posts.find(post => post.id === postId);
  useEffect(() => {
    if (contentRef != null) {
      // @ts-ignore
      contentRef.current?.scrollTo(0, 0);
    }
  }, [postId]);

  if (post == null) {
    return <NoPost />;
  }

  const className = classNames("r-post", {
    read: post.is_read,
    "read-later": post.is_read_later,
  });

  return (
    <div className={className}>
      <div className="r-page-post-navbar">
        <div className="left" />
        <div className="right">
          {post.comments_link && (
            <a href={post.comments_link} className="r-button outline">
              <Icon type="message" />
            </a>
          )}
          <IconButton
            className="read-later"
            icon="bookmark"
            look="outline"
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
            look="outline"
            tabIndex={-1}
            onClick={event => {
              event.preventDefault();
              event.stopPropagation();
              read(post.id, !post.is_read);
            }}
          />
          <IconButton
            icon="close"
            look="outline"
            tabIndex={-1}
            onClick={event => {
              event.preventDefault();
              event.stopPropagation();
              close(post.id, true, hrefPrefix);
            }}
          />
        </div>
      </div>
      <div ref={contentRef} className="r-post-content">
        <h1 className="title">
          <a href={post.link}>{post.title}</a>
        </h1>
        <div className="meta">
          <span className="date">{post.date}</span>
          <span>&nbsp;\&nbsp;</span>
          <span className="feed">
            <NoStateLink
              href={`/category/${post.feed.category_id}/feed/${post.feed.id}`}
            >
              {post.feed.title}
            </NoStateLink>
          </span>
        </div>
        <PostMedia media={post.media} />
        <div className="text">{post.content || post.summary}</div>
      </div>
    </div>
  );
};

interface PostMediaProps {
  media?: {
    type: string;
    link: string;
  };
}

const PostMedia: FC<PostMediaProps> = function PostMedia({ media }) {
  if (media == null) {
    return <div></div>;
  }

  if (media && media.type.startsWith("image")) {
    return (
      <div className="media">
        <img src={media.link} alt="" />
      </div>
    );
  }

  return <div>media</div>;
};
