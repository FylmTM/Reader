const hasOwn = {}.hasOwnProperty;

export function remove(array: any[], index: number) {
  return [...array.slice(0, index), ...array.slice(index + 1)];
}

/**
 * Copy-pasted from https://github.com/JedWatson/classnames
 * Removed flattening of arguments.
 */
export function classNames(...args: any[]) {
  const classes = [];

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (!arg) continue;

    const argType = typeof arg;

    if (argType === "string" || argType === "number") {
      classes.push(arg);
    } else if (argType === "object") {
      for (let key in arg) {
        if (hasOwn.call(arg, key) && arg[key]) {
          classes.push(key);
        }
      }
    }
  }

  return classes.join(" ");
}

export function randomInt(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

export function randomBoolean(): boolean {
  return randomInt(0, 1) === 1;
}
