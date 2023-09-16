// todo: we can theoretically speed this up by
// passing in an object with only the keys we want
// not sure if it's worth it creating that object, though
// which takes time and may outweigh the gains
const findComments = (t, p, s) => {
  if (!p.childNodes) return;

  for (let node of p.childNodes) {
    if (node.nodeType === Node.COMMENT_NODE) {
      const tc = node.textContent.split("@!@");
      if (tc[0] === t) {
        s[tc[1]] = node;
      }
    }

    // Recursively search in child nodes.
    findComments(t, node, s);
  }
};

export const getComments = (t, p) => {
  const result = {}; // Clone the object to ensure original isn't modified.
  findComments(t, p, result);
  return result;
};

export const commentFromCache = (s) => (c) => c[s];

export const remove = Symbol();

export const makeUnindexedId = (token, key) => `d3ku!-${token}-${key}`;

export const go = (
  token,
  parent,
  template,
  attrObj,
  cache,
  topCache,
  instrs
) => {
  for (const { address, payload } of instrs) {
    if (!topCache[address]) {
      const newNode = template.content.firstChild.cloneNode(true);
      parent.appendChild(newNode);
      topCache[address] = newNode;
      const eltCache = {};
      for (const [pxKey, isAttr] of Object.entries(attrObj)) {
        const elt = document.getElementById(makeUnindexedId(token, pxKey));
        elt.removeAttribute("id");
        if (isAttr) {
          eltCache[pxKey] = elt;
        } else {
          const text = document.createTextNode("");
          elt.parentNode.replaceChild(text, elt);
          eltCache[pxKey] = text;
        }
      }
      cache[address] = eltCache;
    }
    const tlElt = topCache[address];
    for (const [pxKey, pxInstr$] of Object.entries(payload)) {
      if (typeof pxInstr$ === "number") {
        const beforeMe = parent.childNodes[pxInstr$];
        beforeMe
          ? parent.insertBefore(tlElt, beforeMe)
          : parent.appendChild(tlElt);
      } else if (pxInstr$ === remove) {
        tlElt.remove();
      } else if (typeof pxInstr$ === "string") {
        const elt = cache[address][pxKey];
        elt.textContent = pxInstr$;
      } else {
        const elt = cache[address][pxKey];
        for (const pxInstr of pxInstr$) {
          if (pxInstr instanceof String) {
            elt.textContent = pxInstr;
          } else if (pxInstr instanceof Number) {
            const beforeMe = parent.childNodes[pxInstr];
            beforeMe
              ? parent.insertBefore(elt, beforeMe)
              : parent.appendChild(elt);
          } else if ("prop" === pxInstr.value.type) {
            elt.setAttribute(pxInstr.key, pxInstr.value.value);
          } else if ("cb" === pxInstr.value.type) {
            const oldListener = elt["$$" + pxInstr.key];
            if (oldListener) {
              elt.removeEventListener(pxInstr.key, oldListener);
            }
            elt.addEventListener(pxInstr.key, (e) => pxInstr.value.value(e)());
            elt["$$" + pxInstr.key] = pxInstr.value.value;
          } else {
            const oldListener = elt["$$" + pxInstr.key];
            if (oldListener) {
              elt.removeEventListener(pxInstr.key, oldListener);
            } else {
              elt.removeAttribute(pxInstr.key);
            }
          }
        }
      }
    }
  }
};
