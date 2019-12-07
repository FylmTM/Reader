/**
 * All icon are taken from Feather Icons set, except below listed exceptions.
 * See: https://feathericons.com/
 * License: MIT.
 *
 * Animated grid icon: https://github.com/SamHerbert/SVG-Loaders/blob/master/svg-loaders/grid.svg
 * License: MIT.
 */
import React, { FC } from "react";
import "./Icon.css";
import { ReactComponent as GridAnimated } from "./icons/grid.svg";
import { ReactComponent as Login } from "./icons/log-in.svg";
import { ReactComponent as Logout } from "./icons/log-out.svg";
import { ReactComponent as Settings } from "./icons/settings.svg";
import { ReactComponent as Collapsed } from "./icons/chevron-right.svg";
import { ReactComponent as Expanded } from "./icons/chevron-down.svg";
import { ReactComponent as Home } from "./icons/home.svg";
import { ReactComponent as Radio } from "./icons/radio.svg";
import { ReactComponent as Close } from "./icons/x.svg";

export type IconType =
  | "login"
  | "logout"
  | "settings"
  | "grid-animated"
  | "collapsed"
  | "expanded"
  | "home"
  | "radio"
  | "close";

interface Props {
  type: IconType;
  large?: boolean;
}

export const Icon: FC<Props> = ({ type, large }) => {
  let className = "r-icon";
  if (large) {
    className = `${className} large`;
  }
  switch (type) {
    case "grid-animated":
      return <GridAnimated className={className} />;
    case "login":
      return <Login className={className} />;
    case "logout":
      return <Logout className={className} />;
    case "settings":
      return <Settings className={className} />;
    case "collapsed":
      return <Collapsed className={className} />;
    case "expanded":
      return <Expanded className={className} />;
    case "home":
      return <Home className={className} />;
    case "radio":
      return <Radio className={className} />;
    case "close":
      return <Close className={className} />;
  }
};
