import React, { FC } from "react";
import { Icon } from "../Icon/Icon";
import "./Activity.css";

interface Props {
  inProgress: boolean;
}

export const Activity: FC<Props> = function Activity({ inProgress, children }) {
  if (inProgress) {
    return (
      <div className="r-activity">
        <Icon type="grid-animated" large={true} />
      </div>
    );
  }

  return <>{children}</>;
};
