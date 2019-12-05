import create from 'zustand'
import { User } from '../domain';
import api from '../api';

type UserStore = {
    current: User | undefined;
    loginInProgress: boolean;
    logoutInProgress: boolean;
    login: () => void
    logout: () => void
}

const userStore = create<UserStore>(set => ({
    current: undefined,
    loginInProgress: false,
    logoutInProgress: false,
    login: () => {
        set({loginInProgress: true});
        api.login()
            .then((user) => {
                set({current: user});
            })
            .catch((error) => {
                console.error(error);
            })
            .finally(() => {
                set({loginInProgress: false})
            });
    },
    logout: () => {
        set({logoutInProgress: true});
        api.logout()
            .then(() => {
                set({current: undefined});
            })
            .catch((error) => {
                console.error(error);
            })
            .finally(() => {
                set({logoutInProgress: false});
            })
    },
}));

export const useUser = userStore[0];

export function useAuthenticatedUser(): { current: User } & UserStore {
    const { current, ...rest } = useUser();
    if (current == null) {
        throw new Error('User must be authenticated');
    }
    return { current, ...rest };
}
