import React, { FC } from 'react';
import { Link, useRoute } from 'wouter';
import * as domain from '../../domain';
import { FEED_ROUTE } from '../../routes';
import './Feed.css';

interface Props {
    feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ feed }) {
    const [match, params] = useRoute<{ feedId: string }>(FEED_ROUTE);
    const isActive = match && params?.feedId === feed.id.toString();
    return (
        <Link
            href={`/feed/${feed.id}`}
            className={`r-feed ellipsis ${isActive && 'r-active'}`}
        >
            {feed.title}
        </Link>
    );
};
