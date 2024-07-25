export const innerHTML = (element) => () => element.innerHTML;

export const transformTextNodes = (element) => (dynTextTag) => () => {
  function getTextNodes(node) {
    let textNodes = [];
    function recursiveSearch(node) {
      node.childNodes.forEach((child) => {
        if (child.nodeType === Node.TEXT_NODE) {
          textNodes.push(child);
        } else if (child.nodeType === Node.ELEMENT_NODE) {
          recursiveSearch(child);
        }
      });
    }
    recursiveSearch(node);
    return textNodes;
  }

  let textNodes = getTextNodes(element);
  let pattern = new RegExp(`^(\\d+)_${dynTextTag}(.*)$`);

  textNodes.forEach((textNode) => {
    let match = textNode.nodeValue.match(pattern);
    if (match) {
      let id = match[1];
      let rest = match[2];

      let beforeComment = document.createComment(`d$i@${id}`);
      let afterComment = document.createComment(`d$o@${id}`);

      // Create a new text node with the modified text
      let newTextNode = document.createTextNode(rest);

      // Replace the old text node with the new nodes
      textNode.parentNode.insertBefore(beforeComment, textNode);
      textNode.parentNode.insertBefore(newTextNode, textNode);
      textNode.parentNode.insertBefore(afterComment, textNode);
      textNode.parentNode.removeChild(textNode);
    }
  });
};

export const mapIdsToTextNodes = (rootElement) => () => {
  const result = [];

  // Create a TreeWalker to traverse the DOM tree and show all comments
  const treeWalker = document.createTreeWalker(
    rootElement,
    NodeFilter.SHOW_COMMENT,
    {
      acceptNode: function (node) {
        if (
          node.nodeType === Node.COMMENT_NODE &&
          node.nodeValue.match(/^d\$i@\d+$/)
        ) {
          return NodeFilter.FILTER_ACCEPT;
        }
        return NodeFilter.FILTER_SKIP;
      },
    },
    false
  );

  // Use the TreeWalker to find the comment nodes
  let currentNode;
  while ((currentNode = treeWalker.nextNode())) {
    const match = currentNode.nodeValue.match(/^d\$i@(\d+)$/);
    if (match) {
      const id = match[1];
      let nextNode = currentNode.nextSibling;

      if (nextNode && nextNode.nodeType === Node.TEXT_NODE) {
        result.push({ k: JSON.parse(id), v: nextNode });
      } else {
        // Create a new text node, insert it after the comment, and make it the value
        const newTextNode = document.createTextNode("");
        currentNode.parentNode.insertBefore(newTextNode, nextNode);
        result.push({ k: JSON.parse(id), v: newTextNode });
      }
    }
  }

  return result;
};
