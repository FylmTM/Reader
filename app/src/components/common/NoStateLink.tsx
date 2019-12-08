import React, { FC, useCallback } from "react";
import "./NoStateLink.css";

type NativeAnchorElement = React.DetailedHTMLProps<
  React.AnchorHTMLAttributes<HTMLAnchorElement>,
  HTMLAnchorElement
> & {
  onClickHref?: string;
};

export function navigate(href: string | undefined) {
  if (href != null) {
    // eslint-disable-next-line no-restricted-globals
    history.pushState({}, "", href);
  }
}

export const NoStateLink: FC<NativeAnchorElement> = function NoStateLink({
  href,
  onClickHref,
  onClick,
  children,
  ...props
}) {
  const handleClick = useCallback(
    event => {
      // ignores the navigation when clicked using right mouse button or
      // by holding a special modifier key: ctrl, command, win, alt, shift
      if (
        event.ctrlKey ||
        event.metaKey ||
        event.altKey ||
        event.shiftKey ||
        event.button !== 0
      ) {
        return;
      }

      event.preventDefault();
      navigate(onClickHref || href);
      onClick && onClick(event);
    },
    [href, onClick, onClickHref]
  );

  return (
    <a href={href} onClick={handleClick} {...props}>
      {children}
    </a>
  );
};

export const NoStateSpanLink: FC<NativeAnchorElement> = function NoStateSpanLink({
  href,
  onClick,
  children,
  className,
  ...props
}) {
  const handleClick = useCallback(
    event => {
      // ignores the navigation when clicked using right mouse button or
      // by holding a special modifier key: ctrl, command, win, alt, shift
      if (
        event.ctrlKey ||
        event.metaKey ||
        event.altKey ||
        event.shiftKey ||
        event.button !== 0
      ) {
        return;
      }

      event.preventDefault();
      navigate(href);
      onClick && onClick(event);
    },
    [href, onClick]
  );

  return (
    <span onClick={handleClick} className={`link ${className}`} {...props}>
      {children}
    </span>
  );
};
