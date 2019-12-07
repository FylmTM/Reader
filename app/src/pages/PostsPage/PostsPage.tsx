import React, { FC } from "react";
import { Button } from "../../components/common/Button/Button";
import "./PostsPage.css";

export const PostsPage: FC = function PostsPage() {
  return (
    <div className="r-page-posts">
      <div className="r-page-posts-navbar">
        <div className="left">
          <span className="r-title">General</span>
        </div>
        <div className="right">
          <Button icon="check" look="outline" />
        </div>
      </div>
    </div>
  );
};
