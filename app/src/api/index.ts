import {
  CategoriesWithFeeds,
  CategoriesWithFeedsUnreadCounts,
  Post,
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
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(
        Array(randomInt(10000, 10000))
          .fill(".")
          .map((_, i) => {
            return {
              id: i + 1,
              category: {
                id: 1,
              },
              feed: {
                id: 1,
                category_id: 1,
                title: "Hacker News",
              },
              is_read: false,
              is_read_later: false,
              link: "http://example.com",
              title: randomBoolean()
                ? "World is finally living on mars."
                : "World is falling down to the works of ancient civilization who is going to do a revolution.",
              date: `${randomInt(1, 10)}h`,
              summary: randomBoolean()
                ? Array(randomInt(1, 100))
                    .fill("summary")
                    .join(" ")
                : undefined,
              content: randomBoolean()
                ? Array(randomInt(1000, 5000))
                    .fill("content")
                    .join(" ")
                : undefined,
              media: randomBoolean()
                ? {
                    type: "image/jpeg",
                    link: "http://localhost:3000/android-chrome-512x512.png",
                  }
                : undefined,
              comments_link: randomBoolean()
                ? "http://example.com/#comments"
                : undefined,
            };
          }),
      );
    }, DELAY);
  });
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
  markAllAsRead,
  markAsRead,
  markAsReadLater,
};
