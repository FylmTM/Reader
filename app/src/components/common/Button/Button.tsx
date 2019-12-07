import React, { FC } from "react";
import { classNames } from "../../../utils";
import { Icon, IconType } from "../Icon/Icon";
import "./Button.css";

type NativeButton = React.DetailedHTMLProps<
  React.ButtonHTMLAttributes<HTMLButtonElement>,
  HTMLButtonElement
>;

type Look = "default" | "outline" | "minimal";
type Size = "default" | "small" | "large";

interface ButtonProps {
  look?: Look;
  icon?: IconType;
  size?: Size;
}

export const Button: FC<NativeButton & ButtonProps> = ({
  look,
  icon,
  size,
  className,
  children,
  ...props
}) => {
  const extendedClassName = classNames(className, look, size);
  return (
    <button {...props} className={extendedClassName}>
      {children}
      {icon && <Icon type={icon} />}
    </button>
  );
};

interface IconButtonProps {
  look?: Look;
  icon: IconType;
  size?: Size;
}

export const IconButton: FC<NativeButton & IconButtonProps> = ({
  look,
  icon,
  size,
  className,
  children,
  ...props
}) => {
  const extendedClassName = classNames(className, look, size);
  return (
    <button {...props} className={extendedClassName}>
      {children}
      <Icon type={icon} />
    </button>
  );
};
