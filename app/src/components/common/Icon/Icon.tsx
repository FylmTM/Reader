import React, { FC } from 'react';
import './Icon.css';
import { ReactComponent as Login } from './log-in.svg';
import { ReactComponent as Logout } from './log-out.svg';
import { ReactComponent as Settings } from './settings.svg';

export type IconType =
    | 'login'
    | 'logout'
    | 'settings'
    ;

export const Icon: FC<{ type: IconType }> = ({ type }) => {
    switch (type) {
        case 'login':
            return <Login />;
        case 'logout':
            return <Logout />;
        case 'settings':
            return <Settings />;
    }
};
