import React, { FC } from 'react';
import * as domain from '../../domain';
import './Feed.css';

interface Props {
    categoryId: number;
    feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ categoryId, feed }) {
    return (
        <a
            href={`/category/${categoryId}/feed/${feed.id}`}
            className="r-feed"
        >
            <div className="r-feed-title ellipsis">
                {feed.title}
            </div>
        </a>
    );
};
