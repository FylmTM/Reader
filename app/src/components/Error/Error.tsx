import React, { FC } from "react";
import { useError } from "../../stores";
import { IconButton } from "../common/Button/Button";
import "./Error.css";

export const Error: FC = function Error() {
  const error = useError();

  if (error.error == null) {
    return <></>;
  }

  return (
    <div className="r-error">
      <IconButton icon="close" look="outline" onClick={error.clear} />
      {error}
    </div>
  );
};
