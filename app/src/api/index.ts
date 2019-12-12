import {
  CategoriesWithFeeds,
  PostsUnreadCount,
  Page,
  Post,
  PostContent,
  PostsSection,
  User,
} from "../domain";
import client from "./client";

function getCurrentUser(): Promise<User> {
  return client.get("/api/v1/auth/current_user");
}

function login(apiKey: string): Promise<User> {
  return client.post("/api/v1/auth/login", { api_key: apiKey });
}

function logout(): Promise<void> {
  return client.post("/api/v1/auth/logout", {});
}

function getCategoriesWithFeeds(): Promise<CategoriesWithFeeds> {
  return client.get("/api/v1/categories_with_feeds");
}

function getCategoriesWithFeedsUnreadCounts(): Promise<PostsUnreadCount> {
  return client.get("/api/v1/posts/unread_count");
}

function getPosts(
  section: PostsSection,
  isUnreadOnly: boolean,
  fromPostId?: number,
): Promise<Page<Post>> {
  const query = [];

  if (fromPostId != null) {
    query.push(`from_post_id=${fromPostId}`);
  }
  if (isUnreadOnly && section.type !== "read-later") {
    query.push(`is_read=false`);
  }

  switch (section.type) {
    case "read-later":
      query.push(`is_read_later=true`);
      break;
    case "all":
      // nothing
      break;
    case "category":
      query.push(`category_id=${section.categoryId}`);
      break;
    case "feed":
      query.push(`feed_id=${section.feedId}`);
      break;
  }

  const queryString = query.length === 0 ? "" : `?${query.join("&")}`;
  return client.get(`/api/v1/posts${queryString}`);
}

function postsMarkAsRead(
  section: PostsSection,
  fromPostId: number,
): Promise<Page<Post>> {
  const query = [];
  query.push(`from_post_id=${fromPostId}`);

  switch (section.type) {
    case "read-later":
      throw new Error("Mark all as read not supported for read-later");
    case "all":
      // nothing
      break;
    case "category":
      query.push(`category_id=${section.categoryId}`);
      break;
    case "feed":
      query.push(`feed_id=${section.feedId}`);
      break;
  }

  const queryString = query.length === 0 ? "" : `?${query.join("&")}`;
  return client.get(`/api/v1/posts/mark_as_read${queryString}`);
}

function getPostContent(postId: number): Promise<PostContent> {
  return client.get(`/api/v1/posts/${postId}/content`);
}

function markAsRead(postId: number, isRead: Boolean): Promise<void> {
  return client.post(`/api/v1/posts/${postId}/is_read`, {
    is_read: isRead,
  });
}

function markAsReadLater(postId: number, isRead: Boolean): Promise<void> {
  return client.post(`/api/v1/posts/${postId}/is_read_later`, {
    is_read_later: isRead,
  });
}

export default {
  getCurrentUser,
  login,
  logout,
  getCategoriesWithFeeds,
  getCategoriesWithFeedsUnreadCounts,
  getPosts,
  postsMarkAsRead,
  getPostContent,
  markAsRead,
  markAsReadLater,
};
