import React, { FC } from 'react';
import { Icon, IconType } from '../Icon/Icon';
import './Button.css';

type NativeButton = React.DetailedHTMLProps<React.ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>;

export type Look =
    | "default"
    | "outline"
    ;

interface Props {
    look?: Look;
    icon?: IconType;
    large?: boolean;
}

export const Button: FC<NativeButton & Props> =
    ({ look, icon, large, className, children, ...props }) => {
        let extendedClassName = className ? className : '';
        if (look) {
            extendedClassName = `${extendedClassName} ${look}`
        }
        if (large) {
            extendedClassName = `${extendedClassName} large`
        }

        return (
            <button
                {...props}
                className={extendedClassName}
            >
                {children}{icon && <Icon type={icon} />}
            </button>
        );
    };
