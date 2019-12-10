import {
  CategoriesWithFeeds,
  CategoriesWithFeedsUnreadCounts,
  Post,
  PostContent,
  PostsSection,
  User,
} from "../domain";
import { randomBoolean, randomInt } from "../utils";
import client from "./client";

const DELAY = 100;

function getCurrentUser(): Promise<User> {
  return client.get("/api/v1/current_user");
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

function getCategoriesWithFeedsUnreadCounts(): Promise<
  CategoriesWithFeedsUnreadCounts
> {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve({
        categories: {
          read_later: randomBoolean() ? randomInt(0, 5) : undefined,
          all: randomBoolean() ? randomInt(0, 5) : undefined,
          1: randomBoolean() ? randomInt(0, 5) : undefined,
          2: randomBoolean() ? randomInt(0, 5) : undefined,
        },
        feeds: {
          1: randomBoolean() ? randomInt(0, 5) : undefined,
          2: randomBoolean() ? randomInt(0, 5) : undefined,
          3: randomBoolean() ? randomInt(0, 5) : undefined,
        },
      });
    }, DELAY);
  });
}

function getPosts(section: PostsSection): Promise<Array<Post>> {
  switch (section.type) {
    case "read-later":
      return client.get("/api/v1/posts/read_later");
    case "all":
      return client.get("/api/v1/posts/all");
    case "category":
      return client.get(`/api/v1/posts/category/${section.categoryId}`);
    case "feed":
      return client.get(`/api/v1/posts/feed/${section.feedId}`);
  }
}

function getPostContent(postId: number): Promise<PostContent> {
  return client.get(`/api/v1/posts/${postId}/content`);
}

function markAllAsRead(
  section: PostsSection,
  lastPostId: number,
): Promise<void> {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, DELAY);
  });
}

function markAsRead(postId: number, isRead: Boolean): Promise<void> {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, DELAY);
  });
}

function markAsReadLater(postId: number, isRead: Boolean): Promise<void> {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, DELAY);
  });
}

export default {
  getCurrentUser,
  login,
  logout,
  getCategoriesWithFeeds,
  getCategoriesWithFeedsUnreadCounts,
  getPosts,
  getPostContent,
  markAllAsRead,
  markAsRead,
  markAsReadLater,
};
