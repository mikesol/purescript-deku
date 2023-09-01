export const newImpl = () => new Map();
export const insert = (key, value, map) => map.set(key, value);
export const remove = (key, map) => map.delete(key);
export const get = (key, map) => { const i = map.get(key); return i === undefined ? null : i; };