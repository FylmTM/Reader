import React, { FC } from "react";
import { useAuthenticatedUser } from "../../stores";
import { Button } from "../common/Button/Button";
import { Categories } from "./Categories";
import "./Sidebar.css";

export const Sidebar: FC = function Sidebar({ children }) {
  const user = useAuthenticatedUser();

  return (
    <div className="r-sidebar">
      <div className="r-sidebar-actions">
        <div className="left">
          <span>{user.current.username}</span>
        </div>
        <div className="right">
          <Button
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
