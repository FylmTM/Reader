import { CategoriesWithFeeds, User } from "../domain";

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
            name: "Gaming - Best Gaming Category in the World"
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

export default {
  getCurrentUser,
  login,
  logout,
  getCategoriesWithFeeds
};
