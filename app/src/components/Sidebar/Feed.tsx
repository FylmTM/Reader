import React, { FC } from "react";
import { Link } from "wouter";
import * as domain from "../../domain";
import { useSection } from "../../stores";
import "./Feed.css";

interface Props {
  categoryId: number;
  feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ categoryId, feed }) {
  const isActive = useSection(
    ({ section }) => section?.type === "feed" && section.feedId === feed.id
  );

  return (
    <Link
      href={`/category/${categoryId}/feed/${feed.id}`}
      className={`r-feed ellipsis ${isActive && "r-active"}`}
    >
      {feed.title}
    </Link>
  );
};
