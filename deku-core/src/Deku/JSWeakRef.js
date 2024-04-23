export const weakRef = (value) => new WeakRef(value);
export const deref = (value) => { const i = value.deref(); return i === undefined ? null : i; };