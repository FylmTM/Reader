import React, { FC } from 'react';
import { Link, useRoute } from 'wouter';
import * as domain from '../../domain';
import './Feed.css';

interface Props {
    categoryId: number;
    feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ categoryId, feed }) {
    const [match, params] = useRoute<{ id: string }>(`/category/:id/feed/:id`);
    const isActive = match && params?.id === feed.id.toString();
    return (
        <Link
            href={`/category/${categoryId}/feed/${feed.id}`}
            className={`r-feed ellipsis ${isActive && 'r-active'}`}
        >
            {feed.title}
        </Link>
    );
};
