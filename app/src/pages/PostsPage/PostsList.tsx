/* eslint-disable react-hooks/exhaustive-deps */
import React, { ComponentType, FC, useEffect, useRef } from "react";
import InfiniteLoader from "react-window-infinite-loader";
import { Activity } from "../../components/common/Activity/Activity";
import { PostsSection } from "../../domain";
import { PostsListItem } from "./PostsListItem";
import { FixedSizeList, ListChildComponentProps } from "react-window";
import AutoSizer from "react-virtualized-auto-sizer";
import { usePosts } from "../../stores";

interface Props {
  section: PostsSection;
  selectedPostId: number | undefined;
  hrefPrefix: string;
  isUnreadOnly: boolean;
}

export const PostsList: FC<Props> = function PostsList({
  section,
  selectedPostId,
  hrefPrefix,
  isUnreadOnly,
}) {
  const posts = usePosts();
  const listRef = useRef<FixedSizeList>(null);

  useEffect(() => {
    const index = posts.posts.findIndex(post => post.id === selectedPostId);
    if (index !== -1) {
      listRef.current?.scrollToItem(index);
    }
  }, [selectedPostId]);

  const hasNextPage = posts.hasNextPage;
  const isNextPageLoading = posts.postsGetInProgress;
  const items = posts.posts;
  const loadNextPage = () => {
    if (items.length > 0) {
      posts.getNextPage(section, isUnreadOnly, items[items.length - 1].id);
    }
    return null;
  };

  const itemCount = hasNextPage ? items.length + 1 : items.length;
  const loadMoreItems = isNextPageLoading ? () => null : loadNextPage;
  const isItemLoaded = (index: number) => !hasNextPage || index < items.length;

  const Row: ComponentType<ListChildComponentProps> = ({ index, style }) => {
    if (!isItemLoaded(index)) {
      return (
        <div className="r-posts-list-item loading" style={style}>
          <Activity />
        </div>
      );
    }
    const post = posts.posts[index];
    return (
      <PostsListItem
        key={post.id}
        post={post}
        hrefPrefix={hrefPrefix}
        isSelected={selectedPostId ? selectedPostId === post.id : false}
        style={style}
      />
    );
  };

  return (
    <AutoSizer>
      {({ height, width }) => (
        <InfiniteLoader
          isItemLoaded={isItemLoaded}
          itemCount={itemCount}
          loadMoreItems={loadMoreItems}
          threshold={5}
        >
          {({ onItemsRendered, ref: loaderRef }) => (
            <FixedSizeList
              // hack to set single ref to 2 places.
              // maybe there is better way to do this?
              ref={ref => {
                // @ts-ignore
                listRef.current = ref;
                // @ts-ignore
                loaderRef(ref);
              }}
              itemSize={130}
              height={height}
              width={width}
              itemCount={itemCount}
              onItemsRendered={onItemsRendered}
            >
              {Row}
            </FixedSizeList>
          )}
        </InfiniteLoader>
      )}
    </AutoSizer>
  );
};
