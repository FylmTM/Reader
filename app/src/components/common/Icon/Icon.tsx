/**
 * All icon are taken from Feather Icons set, except below listed exceptions.
 * See: https://feathericons.com/
 * License: MIT.
 *
 * Animated grid icon: https://github.com/SamHerbert/SVG-Loaders/blob/master/svg-loaders/grid.svg
 * License: MIT.
 */
import React, { FC } from 'react';
import './Icon.css';
import { ReactComponent as GridAnimated } from './icons/grid.svg';
import { ReactComponent as Login } from './icons/log-in.svg';
import { ReactComponent as Logout } from './icons/log-out.svg';
import { ReactComponent as Settings } from './icons/settings.svg';

export type IconType =
    | 'login'
    | 'logout'
    | 'settings'
    | 'grid-animated'
    ;

interface Props {
    type: IconType;
    large?: boolean;
}

export const Icon: FC<Props> = ({ type, large }) => {
    let className = 'r-icon';
    if (large) {
        className = `${className} large`;
    }
    switch (type) {
        case 'login':
            return <Login className={className} />;
        case 'logout':
            return <Logout className={className} />;
        case 'settings':
            return <Settings className={className} />;
        case 'grid-animated':
            return <GridAnimated className={className} />;
    }
};
