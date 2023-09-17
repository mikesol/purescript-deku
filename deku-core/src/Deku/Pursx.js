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

export const makeUnindexedId = (token, key) => `d3ku-${token}-${key}`;

export const newElementCache = () => ({ v: {} });
export const newTopLevelCache = () => ({ v: {} });

export const removeImpl = (parent, cache, topCache) => {
  parent.textContent = "";
  cache.v = {};
  topCache.v = {};
};

// with weakrefs
const go3 = (parent, payload, topCache, cache, address) => {
  const localCache = cache[address];
  for (const [pxKey, pxInstr$] of Object.entries(payload)) {
    if (typeof pxInstr$ === "number") {
      ///
      const tlElt = topCache[address].deref();
      if (!tlElt) {
        delete topCache[address];
        delete cache[address];
        return;
      }
      ///
      const beforeMe = parent.childNodes[pxInstr$];
      beforeMe
        ? parent.insertBefore(tlElt, beforeMe)
        : parent.appendChild(tlElt);
    } else if (pxInstr$ === remove) {
      ///
      const tlElt = topCache[address].deref();
      if (!tlElt) {
        delete topCache[address];
        delete cache[address];
        return;
      }
      tlElt.remove();
      ///
      delete topCache[address];
      delete cache[address];
    } else if (typeof pxInstr$ === "string") {
      ////
      const elt = localCache[pxKey].deref();
      if (!elt) {
        delete topCache[address];
        delete cache[address];
        return;
      }
      ////
      elt.textContent = pxInstr$;
    } else {
      ////
      const elt = localCache[pxKey].deref();
      if (!elt) {
        delete topCache[address];
        delete cache[address];
        return;
      }
      ////
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
};
// no weakrefs
const go2 = (parent, payload, tlElt, localCache, topCache, cache, address) => {
  for (const [pxKey, pxInstr$] of Object.entries(payload)) {
    if (typeof pxInstr$ === "number") {
      const beforeMe = parent.childNodes[pxInstr$];
      beforeMe
        ? parent.insertBefore(tlElt, beforeMe)
        : parent.appendChild(tlElt);
    } else if (pxInstr$ === remove) {
      tlElt.remove();
      delete topCache[address];
      delete cache[address];
    } else if (typeof pxInstr$ === "string") {
      const elt = localCache[pxKey];
      elt.textContent = pxInstr$;
    } else {
      const elt = localCache[pxKey];
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
};

export const go = (
  token,
  parent,
  unsubs,
  template,
  attrObj,
  cache$$,
  topCache$$,
  instrs
) => {
  const cache = cache$$.v;
  const topCache = topCache$$.v;
  for (const { address, payload } of instrs) {
    if (!topCache[address]) {
      const newNode = template.content.firstChild.cloneNode(true);
      parent.appendChild(newNode);
      topCache[address] = new WeakRef(newNode);
      const localCache = {};
      const eltCache = {};
      for (const [pxKey, isAttr] of Object.entries(attrObj)) {
        const idToSearch = makeUnindexedId(token, pxKey);
        // in the case of a detached portal or an element that was recently removed,
        // elt will be null. in that case, we use selectors on the parent
        const elt = parent.querySelector(`#${idToSearch}`);
        elt.removeAttribute("id");
        if (isAttr) {
          localCache[pxKey] = elt;
          eltCache[pxKey] = new WeakRef(elt);
        } else {
          const text = document.createTextNode("");
          elt.parentNode.replaceChild(text, elt);
          localCache[pxKey] = text;
          eltCache[pxKey] = new WeakRef(text);
        }
      }
      cache[address] = eltCache;
      go2(parent, payload, newNode, localCache, topCache, cache, address);
    } else {
      go3(parent, payload, topCache, cache, address)
    }
  }
};
