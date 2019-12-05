import { User } from '../domain';

const DELAY = 0;

function login(): Promise<User> {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve({
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

export default {
    login,
    logout,
};
