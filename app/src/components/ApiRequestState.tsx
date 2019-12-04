import { observer } from "mobx-react-lite";
import React from 'react';
import { useApiStore } from "../stores";

export const ApiRequestState = observer(function ApiRequestState() {
    const apiStore = useApiStore();

    if (apiStore.isRequestInProgress) {
        return <div>in progress</div>;
    } else {
        return <div></div>;
    }
});
