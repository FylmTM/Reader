import React, { FC } from "react";
import "./Input.css";
import { classNames } from "../../../utils";

type NativeInput = React.DetailedHTMLProps<
  React.InputHTMLAttributes<HTMLInputElement>,
  HTMLInputElement
>;

type Size = "default" | "large";

interface Props {
  sizing?: Size;
}

export const Input: FC<Props & NativeInput> = ({
  className,
  sizing,
  ...props
}) => {
  const extendedClassName = classNames(className, sizing);
  return <input {...props} className={extendedClassName} />;
};
