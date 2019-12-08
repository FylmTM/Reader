import React, { FC } from "react";
import * as domain from "../../domain";
import { appStoreApi, useSection } from "../../stores";
import { classNames } from "../../utils";
import { NoStateLink } from "../common/NoStateLink";
import "./Feed.css";

interface Props {
  categoryId: number;
  feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ categoryId, feed }) {
  const isActive = useSection(
    ({ section }) => section?.type === "feed" && section.feedId === feed.id,
  );
  function forceRefresh() {
    if (isActive) {
      appStoreApi.getState().refresh();
    }
  }

  const className = classNames("r-feed ellipsis", { "r-active": isActive });
  return (
    <NoStateLink
      href={`/category/${categoryId}/feed/${feed.id}`}
      className={className}
      onClick={forceRefresh}
    >
      <span className="title ellipsis">{feed.title}</span>
      <span className="unread">123</span>
    </NoStateLink>
  );
};
