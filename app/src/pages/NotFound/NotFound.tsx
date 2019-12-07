import React, { FC } from "react";
import { NoStateLink } from "../../components/common/NoStateLink";
import "./NotFound.css";

export const NotFound: FC = function NotFound() {
  return (
    <div className="r-page-not-found">
      Page not found ¯\_(ツ)_/¯
      <NoStateLink href="/">Main page</NoStateLink>
    </div>
  );
};
