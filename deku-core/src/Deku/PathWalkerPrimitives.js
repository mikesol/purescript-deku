
export const mEltElt = e => e;
export const mEltParent = x => typeof x === 'function' ? x() : x.parentNode;
export const mEltify = e => e;
export const returnReplacementNoIndex = (verb, s, e) => {
  
  // Get the previous sibling (text node) of the element
  let targetString = verb + s + verb;
  let iterNode = typeof e !== 'function' ? e.previousSibling : e().lastChild;
  
  while (iterNode) {
    if (iterNode.nodeType === 8) {
      // 8 is the nodeType for a Comment node
      let index = iterNode.textContent.indexOf(targetString);

      if (index !== -1) {
        return iterNode;
      }
    }
    iterNode = iterNode.previousSibling;
  }

  throw new Error(
    "Programming error: previous node not a text node or target string not found: " +
      s
  );
};

export const returnReplacement = (i, e) => {
  
  // Get the previous sibling (text node) of the element
  let iterNode = typeof e !== 'function' ? e.previousSibling : e().lastChild;
  let ii = 0;
  while (ii < i) {
    ii++;
    iterNode = iterNode.previousSibling;
  }
  return iterNode;
};

export const returnReplacementIndex = (verb, s, e) => {
  
  // Get the previous sibling (text node) of the element
  let targetString = verb + s + verb;
  let iterNode = typeof e !== 'function' ? e.previousSibling : e().lastChild;
  let i = 0;
  while (iterNode) {
    
    if (iterNode.nodeType === 8) {  // 8 is the nodeType for a Comment node
      let index = iterNode.textContent.indexOf(targetString);
      if (index !== -1) {
        return i;
      }
    }
    i++;
    iterNode = iterNode.previousSibling;
  }
  throw new Error("Programming error: previous node not a text node or target string not found: "+s);
};
