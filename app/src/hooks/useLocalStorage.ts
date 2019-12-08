import { useState } from "react";

function parse<T>(value: string | null, fallback: T): T {
  if (value == null) {
    return fallback;
  }
  try {
    return JSON.parse(value);
  } catch {
    return fallback;
  }
}

/**
 * Get initial state from local storage, if exists.
 * This hook intentionally does not listens for local storage changes.
 */
export function useLocalStorage<T>(
  key: string,
  initialState: T,
): [T, (state: T) => void] {
  const [state, setState] = useState(
    parse(localStorage.getItem(key), initialState),
  );

  function writeAndSetState(value: T) {
    localStorage.setItem(key, JSON.stringify(value));
    setState(value);
  }

  return [state, writeAndSetState];
}
