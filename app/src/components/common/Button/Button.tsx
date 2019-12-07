import React, { FC } from "react";
import { Icon, IconType } from "../Icon/Icon";
import "./Button.css";

type NativeButton = React.DetailedHTMLProps<
  React.ButtonHTMLAttributes<HTMLButtonElement>,
  HTMLButtonElement
>;

type Look = "default" | "outline" | "minimal";
type Size = "default" | "small" | "large";

interface Props {
  look?: Look;
  icon?: IconType;
  size?: Size;
}

export const Button: FC<NativeButton & Props> = ({
  look,
  icon,
  size,
  className,
  children,
  ...props
}) => {
  let extendedClassName = className ? className : "";
  if (look) {
    extendedClassName = `${extendedClassName} ${look}`;
  }
  if (size) {
    extendedClassName = `${extendedClassName} ${size}`;
  }

  return (
    <button {...props} className={extendedClassName}>
      {children}
      {icon && <Icon type={icon} />}
    </button>
  );
};
