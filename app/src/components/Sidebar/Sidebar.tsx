import { observer } from 'mobx-react-lite';
import React from 'react';
import { useUserStore } from '../../stores';
import { Activity } from '../common/Activity/Activity';
import { Button } from '../common/Button/Button';
import './Sidebar.css';

export const Sidebar = observer(function Sidebar({ children }) {
    const userStore = useUserStore();
    const user = userStore.user;
    return (
        <>
            <div className="r-sidebar-actions">
                <div className="left">
                    <span>{user.username}</span>
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
            <div className="r-sidebar-content">
                <Activity inProgress={false}>
                    sidebar
                </Activity>
            </div>
        </>
    );
});
