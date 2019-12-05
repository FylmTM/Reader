import React, { FC } from 'react';
import { Icon, IconType } from '../Icon/Icon';
import './Button.css';

type NativeButton = React.DetailedHTMLProps<React.ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>;

interface ButtonProps {
    look?: 'default' | 'outline';
    icon?: IconType;
    size?: 'default' | 'large'
}

export const Button: FC<NativeButton & ButtonProps> = (allProps) => {
    const { look, icon, size, className, children, ...props } = allProps;
    let extendedClassName = className ? className : '';
    if (look) {
        extendedClassName = `${extendedClassName} ${look}`
    }
    if (size) {
        extendedClassName = `${extendedClassName} ${size}`
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
