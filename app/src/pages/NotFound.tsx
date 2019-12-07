import React, { FC } from "react";
import { Link } from "wouter";
import "./NotFound.css";

export const NotFound: FC = function NotFound() {
  return (
    <div className="r-page-not-found">
      Page not found ¯\_(ツ)_/¯
      <Link href="/">Main page</Link>
    </div>
  );
};
