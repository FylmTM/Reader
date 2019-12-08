import React, { FC } from "react";
import * as domain from "../../domain";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import { appStoreApi, useSection, useCategories } from "../../stores";
import { classNames } from "../../utils";
import { Icon } from "../common/Icon/Icon";
import { NoStateLink } from "../common/NoStateLink";
import "./Category.css";
import { Feed } from "./Feed";

interface Props {
  category: domain.Category;
  feeds: Array<domain.Feed>;
}

export const ReadLaterCategory: FC = function ReadLaterCategory() {
  const isActive = useSection(({ section }) => section?.type === "read-later");
  function forceRefresh() {
    if (isActive) {
      appStoreApi.getState().refresh();
    }
  }
  const unreadCount = useCategories(
    state => state.unreadCounts.categories.read_later,
  );

  const className = classNames("r-category", { "r-active": isActive });
  return (
    <NoStateLink
      href="/read-later"
      className={className}
      onClick={forceRefresh}
    >
      <div className="r-category-toggle">
        <Icon type="bookmark" />
      </div>
      <span className="name ellipsis">Read later</span>
      {unreadCount && <span className="unread">{unreadCount}</span>}
    </NoStateLink>
  );
};

export const AllCategory: FC = function AllCategory() {
  const isActive = useSection(({ section }) => section?.type === "all");
  function forceRefresh() {
    if (isActive) {
      appStoreApi.getState().refresh();
    }
  }

  const unreadCount = useCategories(state => state.unreadCounts.categories.all);

  const className = classNames("r-category", { "r-active": isActive });
  return (
    <NoStateLink href="/all" className={className} onClick={forceRefresh}>
      <div className="r-category-toggle">
        <Icon type="radio" />
      </div>
      <span className="name ellipsis">All</span>
      {unreadCount && <span className="unread">{unreadCount}</span>}
    </NoStateLink>
  );
};

export const Category: FC<Props> = function Category({ category, feeds }) {
  const [{ isExpanded }, setState] = useLocalStorage(
    `category-${category.id}-expanded`,
    {
      isExpanded: false,
    },
  );

  const isActive = useSection(
    ({ section }) =>
      section?.type === "category" && section.categoryId === category.id,
  );

  const unreadCount = useCategories(
    state => state.unreadCounts.categories[category.id],
  );

  const className = classNames("r-category", { "r-active": isActive });

  function forceRefresh() {
    if (isActive) {
      appStoreApi.getState().refresh();
    }
  }

  return (
    <>
      <NoStateLink
        href={`/category/${category.id}`}
        className={className}
        onClick={forceRefresh}
      >
        <div
          className="r-category-toggle"
          onClick={event => {
            event.preventDefault();
            event.stopPropagation();
            setState({ isExpanded: !isExpanded });
          }}
        >
          <Icon type={isExpanded ? "expanded" : "collapsed"} />
        </div>
        <span className="name ellipsis">{category.name}</span>
        {unreadCount && <span className="unread">{unreadCount}</span>}
      </NoStateLink>
      {(isExpanded && feeds.length) > 0 && (
        <div className="r-category-feeds">
          {feeds.map(feed => (
            <Feed key={feed.id} categoryId={category.id} feed={feed} />
          ))}
        </div>
      )}
    </>
  );
};
