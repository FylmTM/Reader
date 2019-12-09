export type PostsSection =
  | { type: "read-later"; postId?: number }
  | { type: "all"; postId?: number }
  | { type: "category"; categoryId: number; postId?: number }
  | { type: "feed"; categoryId: number; feedId: number; postId?: number };
export type Section = PostsSection | { type: "not-found" };

export type User = {
  id: number;
  username: string;
};

export type Category = {
  id: number;
  name: string;
};

export type FeedKind = "RSS";

export type Feed = {
  id: number;
  kind: FeedKind;
  title: string;
  link: string;
  feed: string;
};

export type CategoryWithFeeds = {
  category: Category;
  feeds: Array<Feed>;
};

export type CategoriesWithFeeds = Array<CategoryWithFeeds>;

export type CategoriesWithFeedsUnreadCounts = {
  categories: {
    read_later: number | undefined;
    all: number | undefined;
    [categoryId: number]: number | undefined;
  };
  feeds: { [feedId: number]: number | undefined };
};

export type Post = {
  id: number;
  category_id: number;
  feed_id: number;
  feed_title: number;
  is_read: boolean;
  is_read_later: boolean;
  link: string;
  title: string;
  date: string;
  summary?: string;
  media_type?: string;
  media_link?: string;
  comments_link?: string;
};

export type PostContent = {
  id: number;
  content?: string;
};
