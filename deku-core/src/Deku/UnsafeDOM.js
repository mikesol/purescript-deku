export const unsafeParentNode = (e) => e.parentNode;
export const unsafeParentElement = (e) => e.unsafeParentElement;
export const unsafeFirstChild = (e) => e.firstChild;
export const createElement = (t) => document.createElement(t);
export const createElementNS = (ns, t) => document.createElementNS(ns, t);
export const insertBefore = (node1, node2, parent) =>
  parent.insertBefore(node1, node2);
export const appendChild = (node, parent) => parent.appendChild(node);
export const toTemplate = (s) => {
  const template = document.createElement("template");
  template.innerHTML = s;
  return template;
};
export const cloneTemplate = (template) =>
  template.content.cloneNode(true).firstChild;
export const outerHTML = (e) => e.outerHTML;
export const setTextContent = (value, node) => (node.textContent = value);

export const addEventListener = (type, listener, useCapture, target) =>
  target.addEventListener(type, listener, useCapture);

export const removeEventListener = (type, listener, useCapture, target) =>
  target.removeEventListener(type, listener, useCapture);

export const eventListener = (fn) => fn;

export const insertAdjacentHTML = (p, h, n) => n.insertAdjacentHTML(p, h);

export const unsafeGetElementById = (id) => document.getElementById(id);