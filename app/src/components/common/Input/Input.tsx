import React, { FC } from 'react';
import './Input.css';

type NativeInput = React.DetailedHTMLProps<React.InputHTMLAttributes<HTMLInputElement>, HTMLInputElement>;

interface Props {
    large?: boolean;
}

export const Input: FC<Props & NativeInput> = ({ className, large, ...props }) => {
    let extendedClassName = className ? className : '';
    if (large) {
        extendedClassName = `${extendedClassName} large`
    }

    return (
        <input
            {...props}
            className={extendedClassName}
        />
    );
};
