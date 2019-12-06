import React, { FC, useEffect } from 'react';
import { useAuthenticatedUser, useCategories } from '../../stores';
import { Activity } from '../common/Activity/Activity';
import { Button } from '../common/Button/Button';
import { AllCategory, Category } from './Category';
import './Sidebar.css';

export const Sidebar: FC = function Sidebar({ children }) {
    const user = useAuthenticatedUser();
    const { categories, categoriesGetInProgress, getCategories } = useCategories();

    useEffect(() => {
        getCategories();
    }, [getCategories]);

    return (
        <div className="r-sidebar">
            <div className="r-sidebar-content">
                <Activity inProgress={categoriesGetInProgress}>
                    <AllCategory />
                    {categories.map(({ category, feeds }) => (
                        <Category key={category.id} category={category} feeds={feeds} />
                    ))}
                </Activity>
            </div>
            <div className="r-sidebar-actions">
                <div className="left">
                    <span>{user.current.username}</span>
                </div>
                <div className="right">
                    <Button
                        icon="logout"
                        look="outline"
                        onClick={user.logout}
                        disabled={user.logoutInProgress}
                    />
                </div>
            </div>
        </div>
    );
};
