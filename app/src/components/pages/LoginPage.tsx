import { observer } from 'mobx-react-lite';
import React from 'react';
import { useCurrentUserStore } from "../../stores";

export const LoginPage = observer(function LoginPage() {
    const currentUserStore = useCurrentUserStore();
    return (
        <div>
            <button
                onClick={currentUserStore.login}
                disabled={currentUserStore.inProgress.login}
            >
                Login
            </button>
        </div>
    );
});
