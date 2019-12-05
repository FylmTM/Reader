import { CategoriesWithFeeds, User } from '../domain';

const DELAY = 1000;

function login(): Promise<User> {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve({
                id: 1,
                username: 'me',
            });
        }, DELAY);
    });
}

function logout(): Promise<void> {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve();
        }, DELAY);
    });
}

function getCategoriesWithFeeds(): Promise<CategoriesWithFeeds> {
    return new Promise<CategoriesWithFeeds>((resolve) => {
        setTimeout(() => {
            resolve([]);
        }, DELAY);
    });
}

export default {
    login,
    logout,
    getCategoriesWithFeeds,
};
