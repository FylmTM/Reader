import { observer } from 'mobx-react-lite';
import React from 'react';
import { useApiStore, useUserStore } from '../../stores';
import { Button } from '../common/Button/Button';
import { Icon } from '../common/Icon/Icon';
import './Sidebar.css';

export const Sidebar = observer(function Sidebar({ children }) {
    const userStore = useUserStore();
    const apiStore = useApiStore();
    const user = userStore.user;
    return (
        <>
            <div className="r-sidebar-actions">
                <div className="left">
                    <span>{user.username}</span>
                </div>
                <div className="center">
                </div>
                <div className="right">
                    <Button
                        icon="logout"
                        look="outline"
                        onClick={userStore.logout}
                        disabled={userStore.inProgress.logout}
                    />
                </div>
            </div>
            <div className="r-sidebar-footer">
                {apiStore.isRequestInProgress && <Icon type="grid-animated" />}
            </div>
        </>
    );
});
