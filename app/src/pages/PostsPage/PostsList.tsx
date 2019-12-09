/* eslint-disable react-hooks/exhaustive-deps */
import React, { ComponentType, FC, useEffect, useRef } from "react";
import { Post } from "../../domain";
import { PostsListItem } from "./PostsListItem";
import { FixedSizeList, ListChildComponentProps } from "react-window";
import AutoSizer from "react-virtualized-auto-sizer";

interface Props {
  posts: Array<Post>;
  postId: number | undefined;
  hrefPrefix: string;
}

export const PostsList: FC<Props> = function PostsList({
  posts,
  postId,
  hrefPrefix,
}) {
  const ref = useRef(null);
  const Row: ComponentType<ListChildComponentProps> = ({
    index,
    style,
    data,
  }) => {
    const post = posts[index];
    return (
      <PostsListItem
        key={post.id}
        post={post}
        hrefPrefix={hrefPrefix}
        isSelected={postId ? postId === post.id : false}
        style={style}
      />
    );
  };

  useEffect(() => {
    const index = posts.findIndex(post => post.id === postId);
    if (index !== -1) {
      // @ts-ignore
      ref.current?.scrollToItem(index);
    }
  }, [postId]);

  return (
    <AutoSizer>
      {({ height, width }) => (
        <FixedSizeList
          ref={ref}
          height={height}
          itemCount={posts.length}
          itemSize={130}
          width={width}
        >
          {Row}
        </FixedSizeList>
      )}
    </AutoSizer>
  );
};
