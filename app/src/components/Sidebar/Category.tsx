import React, { FC } from 'react';
import { Link, useRoute } from 'wouter';
import * as domain from '../../domain';
import { useLocalStorage } from '../../hooks/useLocalStorage';
import { ALL_ROUTE, CATEGORY_ROUTE } from '../../routes';
import { Icon } from '../common/Icon/Icon';
import './Category.css';
import { Feed } from './Feed';

interface Props {
    category: domain.Category;
    feeds: Array<domain.Feed>;
}

export const AllCategory: FC = function AllCategory() {
    const [match] = useRoute(ALL_ROUTE);
    return (
        <Link
            href="/"
            className={`r-category ${match && 'r-active'}`}
        >
            <div className="r-category-toggle">
                <Icon type='radio' />
            </div>
            <span className="ellipsis">All</span>
        </Link>
    );
};

export const Category: FC<Props> = function Category({ category, feeds }) {
    const [{ expanded }, setState] = useLocalStorage(`category-${category.id}-expanded`, { expanded: false });
    const [match, params] = useRoute<{ categoryId: string }>(CATEGORY_ROUTE);
    const isActive = match && params?.categoryId === category.id.toString();

    return (
        <>
            <Link
                href={`/category/${category.id}`}
                className={`r-category ${isActive && 'r-active'}`}
            >
                <div className="r-category-toggle" onClick={(event) => {
                    event.preventDefault();
                    setState({ expanded: !expanded });
                }}>
                    <Icon type={expanded ? 'expanded' : 'collapsed'} />
                </div>
                <span className="ellipsis">{category.name}</span>
            </Link>
            {(expanded && feeds.length) > 0 && (
                <div className="r-category-feeds">
                    {feeds.map(feed => <Feed key={feed.id} categoryId={category.id} feed={feed} />)}
                </div>
            )}
        </>
    );
};
