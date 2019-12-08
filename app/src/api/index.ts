import {
  CategoriesWithFeeds,
  CategoriesWithFeedsUnreadCounts,
  Post,
  PostsSection,
  User,
} from "../domain";
import { randomBoolean, randomInt } from "../utils";

const DELAY = 100;

function getCurrentUser(): Promise<User> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve({
        id: 1,
        username: "me",
      });
    }, DELAY);
  });
}

function login(apiKey: string): Promise<User> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve({
        id: 1,
        username: "me",
      });
    }, DELAY);
  });
}

function logout(): Promise<void> {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, DELAY);
  });
}

function getCategoriesWithFeeds(): Promise<CategoriesWithFeeds> {
  return new Promise<CategoriesWithFeeds>((resolve, reject) => {
    setTimeout(() => {
      resolve([
        {
          category: {
            id: 1,
            name: "General",
          },
          feeds: [
            {
              id: 1,
              kind: "RSS",
              title: "Hacker News",
              link: "https://news.ycombinator.com/",
              feed: "https://news.ycombinator.com/rss",
            },
            {
              id: 2,
              kind: "RSS",
              title: "vc.ru",
              link: "https://vc.ru/",
              feed: "https://vc.ru/rss/all",
            },
          ],
        },
        {
          category: {
            id: 2,
            name: "Gaming - Best Gaming Category in the whole World",
          },
          feeds: [
            {
              id: 3,
              kind: "RSS",
              title: "StopGame - Best Gaming Website in the World",
              link: "https://stopgame.ru",
              feed: "https://rss.stopgame.ru/rss_all.xml",
            },
          ],
        },
      ]);
    }, DELAY);
  });
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
        Array(randomInt(5, 20))
          .fill(".")
          .map((_, i) => {
            return {
              id: i + 1,
              is_read: false,
              is_read_later: false,
              category: {
                id: 1,
              },
              feed: {
                id: 1,
                category_id: 1,
                title: "Hacker News",
              },
              link: "http://example.com",
              title: randomBoolean()
                ? "World is finally living on mars."
                : "World is falling down to the works of ancient civilization who is going to do a revolution.",
              summary: randomBoolean()
                ? Array(randomInt(1, 100))
                    .fill("lorem")
                    .join(" ")
                : undefined,
              date: `${randomInt(1, 10)}h`,
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
