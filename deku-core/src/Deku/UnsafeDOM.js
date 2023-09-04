export const unsafeParentNode = (e) => e.parentNode;
export const createElement = (t) => document.createElement(t);
export const createElementNS = (ns, t) => document.createElementNS(ns, t);
export const insertBefore = (node1, node2, parent) =>
  parent.insertBefore(node1, node2);
export const appendChild = (node, parent) => parent.appendChild(node);
