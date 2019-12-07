import React, { FC } from "react";
import { useAuthenticatedUser } from "../../stores";
import { IconButton } from "../common/Button/Button";
import { NoStateLink } from "../common/NoStateLink";
import { Categories } from "./Categories";
import "./Sidebar.css";

export const Sidebar: FC = function Sidebar({ children }) {
  const user = useAuthenticatedUser();

  return (
    <div className="r-sidebar">
      <div className="r-sidebar-navbar">
        <div className="left">
          <NoStateLink href="/">{user.current.username}</NoStateLink>
        </div>
        <div className="right">
          <IconButton
            icon="logout"
            look="outline"
            onClick={user.logout}
            disabled={user.logoutInProgress}
          />
        </div>
      </div>
      <div className="r-sidebar-content">
        <Categories />
      </div>
    </div>
  );
};
