import React, { FC } from "react";
import { Link } from "wouter";
import * as domain from "../../domain";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import { useSection } from "../../stores";
import { Icon } from "../common/Icon/Icon";
import "./Category.css";
import { Feed } from "./Feed";

interface Props {
  category: domain.Category;
  feeds: Array<domain.Feed>;
}

export const ReadLaterCategory: FC = function ReadLaterCategory() {
  const isActive = useSection(({ section }) => section?.type === "read-later");

  return (
    <Link href="/read-later" className={`r-category ${isActive && "r-active"}`}>
      <div className="r-category-toggle">
        <Icon type="bookmark" />
      </div>
      <span className="ellipsis">Read later</span>
    </Link>
  );
};

export const AllCategory: FC = function AllCategory() {
  const isActive = useSection(({ section }) => section?.type === "all");

  return (
    <Link href="/all" className={`r-category ${isActive && "r-active"}`}>
      <div className="r-category-toggle">
        <Icon type="radio" />
      </div>
      <span className="ellipsis">All</span>
    </Link>
  );
};

export const Category: FC<Props> = function Category({ category, feeds }) {
  const [
    { expanded },
    setState
  ] = useLocalStorage(`category-${category.id}-expanded`, { expanded: false });

  const isActive = useSection(
    ({ section }) =>
      section?.type === "category" && section.categoryId === category.id
  );

  return (
    <>
      <Link
        href={`/category/${category.id}`}
        className={`r-category ${isActive && "r-active"}`}
      >
        <div
          className="r-category-toggle"
          onClick={event => {
            event.preventDefault();
            setState({ expanded: !expanded });
          }}
        >
          <Icon type={expanded ? "expanded" : "collapsed"} />
        </div>
        <span className="ellipsis">{category.name}</span>
      </Link>
      {(expanded && feeds.length) > 0 && (
        <div className="r-category-feeds">
          {feeds.map(feed => (
            <Feed key={feed.id} feed={feed} />
          ))}
        </div>
      )}
    </>
  );
};
