import { CategoriesWithFeeds, User } from '../domain';

const DELAY = 100;

function getCurrentUser(): Promise<User> {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve({
                id: 1,
                username: 'me',
            });
        }, DELAY);
    });
}

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
    getCurrentUser,
    login,
    logout,
    getCategoriesWithFeeds,
};
