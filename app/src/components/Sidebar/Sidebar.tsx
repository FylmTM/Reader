import { observer } from 'mobx-react-lite';
import React from 'react';
import { useCurrentUserStore } from '../../stores';
import { Button } from '../common/Button/Button';
import { ActivityStatus } from './ActivityStatus';
import './Sidebar.css';

export const Sidebar = observer(function Sidebar({ children }) {
    const currentUserStore = useCurrentUserStore();
    return (
        <>
            <div className="r-sidebar-actions">
                <div className="left">
                    <Button
                        icon="settings"
                        look="outline"
                    />
                </div>
                <div className="right">
                    <Button
                        icon="logout"
                        look="outline"
                        onClick={currentUserStore.logout}
                        disabled={currentUserStore.inProgress.logout}
                    />
                </div>
            </div>
            <ActivityStatus />
        </>
    );
});
