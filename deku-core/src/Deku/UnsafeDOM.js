export const unsafeParentNode = (e) => e.parentNode;
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
export const cloneElement = (node) => node.cloneNode(true);
export const getTemplateFirstChild = (template) => template.content.firstChild;
export const cloneTemplate = (template) =>
  template.content.cloneNode(true).firstChild;
export const outerHTML = (e) => e.outerHTML;

export const addEventListener = (type, listener, useCapture, target) =>
  target.addEventListener(type, listener, useCapture);

export const removeEventListener = (type, listener, useCapture, target) =>
  target.removeEventListener(type, listener, useCapture);
