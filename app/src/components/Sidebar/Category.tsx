import React, { FC } from 'react';
import * as domain from '../../domain';
import { useLocalStorage } from '../../hooks/useLocalStorage';
import { Icon } from '../common/Icon/Icon';
import './Category.css';
import { Feed } from './Feed';

interface Props {
    category: domain.Category;
    feeds: Array<domain.Feed>;
}

export const AllCategory: FC = function AllCategory() {
    return (
        <a
            href="/"
            className="r-category"
        >
            <div className="r-category-toggle">
                <Icon type='radio' />
            </div>
            <span className="ellipsis">All</span>
        </a>
    );
};

export const Category: FC<Props> = function Category({ category, feeds }) {
    const [{ expanded }, setState] = useLocalStorage(`category-${category.id}-expanded`, { expanded: false });

    return (
        <>
            <a
                href={`/category/${category.id}`}
                className="r-category"
            >
                <div className="r-category-toggle" onClick={(event) => {
                    event.preventDefault();
                    setState({ expanded: !expanded });
                }}>
                    <Icon type={expanded ? 'expanded' : 'collapsed'} />
                </div>
                <span className="ellipsis">{category.name}</span>
            </a>
            {(expanded && feeds.length) > 0 && (
                <div className="r-category-feeds">
                    {feeds.map(feed => <Feed key={feed.id} categoryId={category.id} feed={feed} />)}
                </div>
            )}
        </>
    );
};
