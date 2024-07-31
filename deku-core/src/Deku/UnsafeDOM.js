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

export const createElement = (t) => document.createElement(t);
export const after = ( cs, t) => t.after.apply( t, cs );
export const prepend = ( cs, t ) => t.prepend.apply( t, cs );

export const createElementNS = (ns, t) => document.createElementNS(ns, t);
export const createText = ( t ) => document.createTextNode( t );
export const createDocumentFragment = () => document.createDocumentFragment();

export const setTextContent = (value, node) => (node.textContent = value);

export const addEventListener = (type, listener, useCapture, target) =>
  target.addEventListener(type, listener, useCapture);

export const removeEventListener = (type, listener, useCapture, target) =>
  target.removeEventListener(type, listener, useCapture);

export const eventListener = (fn) => fn;
