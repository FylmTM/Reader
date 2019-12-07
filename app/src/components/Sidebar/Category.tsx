import React, { FC } from "react";
import * as domain from "../../domain";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import { useSection } from "../../stores";
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

  const className = classNames("r-category", { "r-active": isActive });
  return (
    <NoStateLink href="/read-later" className={className}>
      <div className="r-category-toggle">
        <Icon type="bookmark" />
      </div>
      <span className="ellipsis">Read later</span>
    </NoStateLink>
  );
};

export const AllCategory: FC = function AllCategory() {
  const isActive = useSection(({ section }) => section?.type === "all");

  const className = classNames("r-category", { "r-active": isActive });
  return (
    <NoStateLink href="/all" className={className}>
      <div className="r-category-toggle">
        <Icon type="radio" />
      </div>
      <span className="ellipsis">All</span>
    </NoStateLink>
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

  const className = classNames("r-category", { "r-active": isActive });
  return (
    <>
      <NoStateLink href={`/category/${category.id}`} className={className}>
        <div
          className="r-category-toggle"
          onClick={event => {
            event.preventDefault();
            event.stopPropagation();
            setState({ expanded: !expanded });
          }}
        >
          <Icon type={expanded ? "expanded" : "collapsed"} />
        </div>
        <span className="ellipsis">{category.name}</span>
      </NoStateLink>
      {(expanded && feeds.length) > 0 && (
        <div className="r-category-feeds">
          {feeds.map(feed => (
            <Feed key={feed.id} categoryId={category.id} feed={feed} />
          ))}
        </div>
      )}
    </>
  );
};
