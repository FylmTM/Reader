import React, { FC } from "react";
import * as domain from "../../domain";
import { useSection } from "../../stores";
import { classNames } from "../../utils";
import { NoStateLink } from "../common/NoStateLink";
import "./Feed.css";

interface Props {
  categoryId: number;
  feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ categoryId, feed }) {
  const isActive = useSection(
    ({ section }) => section?.type === "feed" && section.feedId === feed.id
  );

  const className = classNames("r-feed ellipsis", { "r-active": isActive });
  return (
    <NoStateLink
      href={`/category/${categoryId}/feed/${feed.id}`}
      className={className}
    >
      {feed.title}
    </NoStateLink>
  );
};
