import { CategoriesWithFeeds, Post, User } from "../domain";

const DELAY = 200;

function getCurrentUser(): Promise<User> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve({
        id: 1,
        username: "me"
      });
    }, DELAY);
  });
}

function login(): Promise<User> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve({
        id: 1,
        username: "me"
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
            name: "General"
          },
          feeds: [
            {
              id: 1,
              kind: "RSS",
              title: "Hacker News",
              link: "https://news.ycombinator.com/",
              feed: "https://news.ycombinator.com/rss"
            },
            {
              id: 2,
              kind: "RSS",
              title: "vc.ru",
              link: "https://vc.ru/",
              feed: "https://vc.ru/rss/all"
            }
          ]
        },
        {
          category: {
            id: 2,
            name: "Gaming - Best Gaming Category in the whole World"
          },
          feeds: [
            {
              id: 3,
              kind: "RSS",
              title: "StopGame - Best Gaming Website in the World",
              link: "https://stopgame.ru",
              feed: "https://rss.stopgame.ru/rss_all.xml"
            }
          ]
        }
      ]);
    }, DELAY);
  });
}

function randomInt(min: number, max: number) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getPosts(): Promise<Array<Post>> {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(
        Array(15)
          .fill(".")
          .map((_, i) => {
            return {
              id: i + 1,
              is_read: false,
              is_read_later: false,
              feed: {
                id: 1,
                category_id: 1,
                title: "Hacker News"
              },
              link: "http://example.com",
              title:
                randomInt(0, 1) === 1
                  ? "World is finally living on mars."
                  : "World is falling down to the works of ancient civilization who is going to do a revolution.",
              summary:
                randomInt(0, 1) === 1
                  ? Array(randomInt(1, 100))
                      .fill("lorem")
                      .join(" ")
                  : undefined,
              date: `${randomInt(1, 10)}h`,
              media:
                randomInt(0, 1) === 1
                  ? {
                      type: "image/jpeg",
                      // link: "http://localhost:3000/android-chrome-512x512.png"
                      link:
                        "https://stopga.me/images/video/2019/12/07/M8MFv_nN.jpg"
                    }
                  : undefined,
              comments_link:
                randomInt(0, 1) === 1
                  ? "http://example.com/#comments"
                  : undefined
            };
          })
      );
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
  getPosts,
  markAsRead,
  markAsReadLater
};
