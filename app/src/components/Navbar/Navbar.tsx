import React, { FC } from "react";
import "./Navbar.css";

export const Navbar: FC = function Navbar({ children }) {
  return <div className="r-navbar">{children}</div>;
};
