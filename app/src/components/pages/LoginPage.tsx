import { observer } from 'mobx-react-lite';
import React from 'react';
import { useUserStore } from '../../stores';
import { Activity } from '../common/Activity/Activity';
import { Button } from '../common/Button/Button';
import { Input } from '../common/Input/Input';
import './LoginPage.css';

export const LoginPage = observer(function LoginPage() {
    const userStore = useUserStore();
    return (
        <Activity inProgress={userStore.inProgress.login}>
            <form className="r-page-login" onSubmit={(event) => {
                event.preventDefault();
                if (userStore.inProgress.login) {
                    return;
                }
                userStore.login();
            }}>
                <Input large={true} type="password" placeholder="API key" autoFocus={true} />
                <Button
                    icon="login"
                    large={true}
                    type="submit"
                    disabled={userStore.inProgress.login}
                />
            </form>
        </Activity>
    );
});
