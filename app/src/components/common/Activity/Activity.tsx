import React, { FC } from "react";
import { Icon } from "../Icon/Icon";
import "./Activity.css";

interface Props {
  inProgress?: boolean;
}

export const Activity: FC<Props> = function Activity({
  inProgress = true,
  children
}) {
  if (inProgress) {
    return (
      <div className="r-activity">
        <Icon type="grid-animated" size="large" />
      </div>
    );
  }

  return <>{children}</>;
};
