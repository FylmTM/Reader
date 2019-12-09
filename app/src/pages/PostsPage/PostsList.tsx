import React, { ComponentType, FC } from "react";
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

  return (
    <AutoSizer>
      {({ height, width }) => (
        <FixedSizeList
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
