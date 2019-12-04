import { User } from '../domain';

function login(): Promise<User> {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve({
                username: "me"
            });
        }, 200);
    });
}

function logout(): Promise<void> {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve();
        }, 200);
    });
}

export default {
    login,
    logout
};
