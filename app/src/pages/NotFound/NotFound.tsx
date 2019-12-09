import React, { FC } from "react";
import { NoStateLink } from "../../components/common/NoStateLink";
import "./NotFound.css";

export const NotFound: FC = function NotFound() {
  return (
    <div className="r-page-not-found">
      <span>Page not found ¯\_(ツ)_/¯</span>
      <NoStateLink href="/">Go to main page.</NoStateLink>
    </div>
  );
};
