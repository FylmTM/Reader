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

export type MediaType = {
  mime: string;
};

export type Post = {
  id: number;
  link: string;
  title: string;
  date: string;
  content: string | undefined;
  media_type: string | undefined;
  media_link: string | undefined;
  comments_link: string | undefined;
};

export type Section =
  | { type: "read-later"; postId?: number }
  | { type: "all"; postId?: number }
  | { type: "category"; categoryId: number; postId?: number }
  | { type: "feed"; feedId: number; postId?: number }
  | { type: "not-found" };
