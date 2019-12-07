import React, { FC } from "react";
import { Link } from "wouter";
import * as domain from "../../domain";
import { useSection } from "../../stores";
import "./Feed.css";

interface Props {
  feed: domain.Feed;
}

export const Feed: FC<Props> = function Feed({ feed }) {
  const isActive = useSection(
    ({ section }) => section?.type === "feed" && section.feedId === feed.id
  );

  return (
    <Link
      href={`/feed/${feed.id}`}
      className={`r-feed ellipsis ${isActive && "r-active"}`}
    >
      {feed.title}
    </Link>
  );
};
