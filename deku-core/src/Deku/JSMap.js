export const newImpl = () => new WeakMap();
export const getImpl = (k, m) => m.get(k);
export const setImpl = (k, v, m) => m.set(k, v);