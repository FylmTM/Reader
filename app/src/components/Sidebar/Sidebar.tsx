import React, { FC } from "react";
import { useAuthenticatedUser } from "../../stores";
import { IconButton } from "../common/Button/Button";
import { NoStateLink } from "../common/NoStateLink";
import { Navbar } from "../Navbar/Navbar";
import { Categories } from "./Categories";
import "./Sidebar.css";

export const Sidebar: FC = function Sidebar({ children }) {
  const user = useAuthenticatedUser();

  return (
    <div className="r-sidebar">
      <Navbar>
        <div className="left">
          <NoStateLink href="/">{user.current.username}</NoStateLink>
        </div>
        <div className="right">
          <IconButton
            icon="power"
            look="outline"
            onClick={user.logout}
            disabled={user.logoutInProgress}
          />
        </div>
      </Navbar>
      <div className="r-sidebar-content">
        <Categories />
      </div>
    </div>
  );
};
