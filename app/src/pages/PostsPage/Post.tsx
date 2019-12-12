/* eslint-disable react-hooks/exhaustive-deps */
import React, { FC, useEffect } from "react";
import { IconButton } from "../../components/common/Button/Button";
import { Icon } from "../../components/common/Icon/Icon";
import { NoStateLink } from "../../components/common/NoStateLink";
import { Navbar } from "../../components/Navbar/Navbar";
import { usePosts, usePostContent } from "../../stores";
import { classNames } from "../../utils";
import "./Post.css";
import formatDistanceToNow from "date-fns/formatDistanceToNow";
import parseISO from "date-fns/parseISO";

const NoPost: FC = function NoPost() {
  return (
    <div className="r-post">
      <Navbar>
        <div className="left" />
        <div className="right" />
      </Navbar>
    </div>
  );
};

interface Props {
  postId: number | undefined;
  hrefPrefix: string;
}

export const Post: FC<Props> = function Post({ postId, hrefPrefix }) {
  const { posts, read, readLater, close } = usePosts();
  const post = posts.find(post => post.id === postId);
  const postContent = usePostContent();

  useEffect(() => {
    if (post == null) {
      postContent.unset();
    } else {
      postContent.get(post.id);
    }
  }, [postId]);

  if (post == null) {
    return <NoPost />;
  }

  const className = classNames("r-post", {
    read: post.is_read,
    "read-later": post.is_read_later,
  });

  const isContentLoaded = postContent.postContent?.id === post.id;
  let contentHTML = undefined;
  if (isContentLoaded && postContent.postContent?.content != null) {
    contentHTML = { __html: postContent.postContent.content };
  }

  const since = formatDistanceToNow(parseISO(post.date));

  return (
    <div className={className}>
      <Navbar>
        <div className="left" />
        <div className="right">
          {post.comments_link && (
            <a
              href={post.comments_link}
              target="_blank"
              rel="noopener noreferrer"
              className="r-button outline"
            >
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
      </Navbar>
      <div className="r-post-content">
        <div className="inner">
          <h1 className="title">
            <a href={post.link} target="_blank" rel="noopener noreferrer">
              {post.title}
            </a>
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
          {isContentLoaded && (
            <>
              <PostMedia
                type={post.media_type}
                link={post.media_link}
                content={postContent.postContent?.content}
              />
              {contentHTML && (
                <div className="text" dangerouslySetInnerHTML={contentHTML} />
              )}
            </>
          )}
        </div>
      </div>
    </div>
  );
};

interface PostMediaProps {
  type?: string;
  link?: string;
  content?: string;
}

const PostMedia: FC<PostMediaProps> = function PostMedia({
  type,
  link,
  content,
}) {
  if (type == null || link == null) {
    return <div></div>;
  }

  // If content already has this media, don't double show it.
  if (content && content.includes(link)) {
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
