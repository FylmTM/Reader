import React, { FC } from 'react';
import * as domain from '../../domain';
import { Icon } from '../common/Icon/Icon';
import './Category.css';
import { Feed } from './Feed';

interface Props {
    category: domain.Category;
    feeds: Array<domain.Feed>;
}

export const AllCategory: FC = function AllCategory() {
    return (
        <div className="r-category">
            <a
                href="/"
                className="r-category-title r-active"
            >
                <div className="r-category-toggle">
                    <Icon type='radio' />
                </div>
                All
            </a>
        </div>
    );
};

export const Category: FC<Props> = function Category({ category, feeds }) {
    return (
        <div className="r-category">
            <a
                href={`/category/${category.id}`}
                className="r-category-title"
            >
                <div className="r-category-toggle">
                    <Icon type='collapsed' />
                </div>
                <span className="ellipsis">
                    {category.name}
                </span>
            </a>
            {feeds.length > 0 && (
                <div className="r-category-feeds">
                    {feeds.map(feed => <Feed key={feed.id} categoryId={category.id} feed={feed} />)}
                </div>
            )}
        </div>
    );
};
