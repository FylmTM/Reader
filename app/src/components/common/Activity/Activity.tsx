import React, { FC, useEffect, useState } from "react";
import { Icon } from "../Icon/Icon";
import "./Activity.css";

interface Props {
  inProgress?: boolean;
}

export const Activity: FC<Props> = function Activity({
  inProgress = true,
  children,
}) {
  const [showAnimation, setShowAnimation] = useState(false);
  useEffect(() => {
    const timer = setTimeout(() => {
      setShowAnimation(true);
    }, 100);
    return () => clearTimeout(timer);
  }, []);

  if (inProgress) {
    return (
      <div className="r-activity">
        {showAnimation && <Icon type="grid-animated" size="large" />}
      </div>
    );
  }

  return <>{children}</>;
};
