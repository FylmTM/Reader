import { observer } from 'mobx-react-lite';
import React from 'react';
import { useCurrentUserStore } from '../../stores';
import { Button } from '../common/Button/Button';
import './LoginPage.css';

export const LoginPage = observer(function LoginPage() {
    const currentUserStore = useCurrentUserStore();
    return (
        <form className="r-page-login" onSubmit={(event) => {
            event.preventDefault();
            currentUserStore.login();
        }}>
            <input type="password" className="large" placeholder="API key" autoFocus={true}/>
            <Button
                icon="login"
                size="large"
                onClick={currentUserStore.login}
                disabled={currentUserStore.inProgress.login}
            />
        </form>
    );
});
