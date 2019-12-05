import { observer } from 'mobx-react-lite';
import React from 'react';
import { useApiStore } from '../../stores';

export const ActivityStatus = observer(function ActivityStatus() {
    const apiStore = useApiStore();

    if (apiStore.isRequestInProgress) {
        return <div>in progress</div>;
    } else {
        return <div></div>;
    }
});
