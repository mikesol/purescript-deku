const cbs = new WeakMap();

export const pushCb = ( name, cb, el ) =>
{
  var ns = cbs.get( el );
  if( ns != null )
    ns[ name ] = cb;
  else
    cbs.set( el, { [name] : cb } );
};

export const popCb = ( name, el ) =>
{
  var ns = cbs.get( el );
  if( ns == null )
    return null;
  else
  {
    var result = ns[ name ] ?? null;
    ns[ name ] = undefined;
    return result;
  }
};

export const unsafeParentNode = (e) => e.parentNode;
export const unsafeFirstChildAsElement = (e) => e.firstChild;

export const createElement = (t) => document.createElement(t);
export const after = (c,t) => t.after( c );
export const prepend = ( c, t ) => t.prepend( c );

export const createElementNS = (ns, t) => document.createElementNS(ns, t);
export const createText = ( t ) => document.createTextNode( t );

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
export const cloneElement = (e) =>
  e.cloneNode(true);
export const outerHTML = (e) => e.outerHTML;
export const setTextContent = (value, node) => (node.textContent = value);

export const addEventListener = (type, listener, useCapture, target) =>
  target.addEventListener(type, listener, useCapture);

export const removeEventListener = (type, listener, useCapture, target) =>
  target.removeEventListener(type, listener, useCapture);

export const eventListener = (fn) => fn;
