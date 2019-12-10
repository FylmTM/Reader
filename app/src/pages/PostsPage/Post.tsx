/* eslint-disable react-hooks/exhaustive-deps */
import React, { FC, useEffect, useRef } from "react";
import { IconButton } from "../../components/common/Button/Button";
import { Icon } from "../../components/common/Icon/Icon";
import { NoStateLink } from "../../components/common/NoStateLink";
import { usePosts, usePostContent } from "../../stores";
import { classNames } from "../../utils";
import "./Post.css";
import formatDistanceToNow from "date-fns/formatDistanceToNow";
import parseISO from "date-fns/parseISO";

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
  const postContent = usePostContent();

  useEffect(() => {
    if (contentRef != null) {
      // @ts-ignore
      contentRef.current?.scrollTo(0, 0);
    }
    if (post != null) {
      postContent.get(post.id);
    } else {
      postContent.unset();
    }
  }, [postId]);

  if (post == null) {
    return <NoPost />;
  }

  const className = classNames("r-post", {
    read: post.is_read,
    "read-later": post.is_read_later,
  });

  let content = undefined;
  if (postContent.postContent?.content != null) {
    content = { __html: postContent.postContent.content };
  }

  const since = formatDistanceToNow(parseISO(post.date));

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
          <span className="date">{since}</span>
          <span>&nbsp;\&nbsp;</span>
          <span className="feed">
            <NoStateLink
              href={`/category/${post.category_id}/feed/${post.feed_id}`}
            >
              {post.feed_title}
            </NoStateLink>
          </span>
        </div>
        <PostMedia type={post.media_type} link={post.media_link} />
        {content && <div className="text" dangerouslySetInnerHTML={content} />}
      </div>
    </div>
  );
};

interface PostMediaProps {
  type?: string;
  link?: string;
}

const PostMedia: FC<PostMediaProps> = function PostMedia({ type, link }) {
  if (type == null || link == null) {
    return <div></div>;
  }

  if (type.startsWith("image")) {
    return (
      <div className="media">
        <img src={link} alt="" />
      </div>
    );
  }

  return <div></div>;
};
