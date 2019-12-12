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
import { classNames } from "../../../utils";
import { ReactComponent as GridAnimated } from "./icons/grid.svg";
import { ReactComponent as Power } from "./icons/power.svg";
import { ReactComponent as Settings } from "./icons/settings.svg";
import { ReactComponent as Collapsed } from "./icons/chevron-right.svg";
import { ReactComponent as Expanded } from "./icons/chevron-down.svg";
import { ReactComponent as Home } from "./icons/home.svg";
import { ReactComponent as Radio } from "./icons/radio.svg";
import { ReactComponent as Close } from "./icons/x.svg";
import { ReactComponent as Bookmark } from "./icons/bookmark.svg";
import { ReactComponent as Check } from "./icons/check.svg";
import { ReactComponent as Refresh } from "./icons/refresh-cw.svg";
import { ReactComponent as Message } from "./icons/message-circle.svg";

export type IconType =
  | "power"
  | "settings"
  | "grid-animated"
  | "collapsed"
  | "expanded"
  | "home"
  | "radio"
  | "close"
  | "bookmark"
  | "check"
  | "refresh"
  | "message";

type Size = "default" | "small" | "large";

interface Props {
  type: IconType;
  size?: Size;
}

export const Icon: FC<Props> = ({ type, size }) => {
  const className = classNames("r-icon", size);
  switch (type) {
    case "grid-animated":
      return <GridAnimated className={className} />;
    case "power":
      return <Power className={className} />;
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
    case "bookmark":
      return <Bookmark className={className} />;
    case "check":
      return <Check className={className} />;
    case "refresh":
      return <Refresh className={className} />;
    case "message":
      return <Message className={className} />;
  }
};
