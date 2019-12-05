import React, { FC } from 'react';
import './Container.css';
import { Sidebar } from './Sidebar/Sidebar';

export const Container: FC = function Container({ children }) {
    return (
        <div className="r-container">
            <div className="r-sidebar">
                <Sidebar />
            </div>
            <div className="r-page">
                {children}
            </div>
        </div>
    );
};
