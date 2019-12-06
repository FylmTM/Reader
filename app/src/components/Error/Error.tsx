import React, { FC } from 'react';
import { useError } from '../../stores';
import './Error.css';
import { Button } from '../common/Button/Button';

export const Error: FC = function Error() {
    const { error, clear } = useError();

    if (error == null) {
        return <></>;
    }

    return (
        <div className="r-error">
            <Button icon='close' look='outline' onClick={clear}/>
            {error}
        </div>
    );
};
