export const innerHTML = (element) => () => element.innerHTML;

export const transformTextNode = (id) => (textNode) => () => {

      let beforeComment = document.createComment(`d$i@${id}`);
      let afterComment = document.createComment(`d$o@${id}`);

      textNode.parentNode.insertBefore(beforeComment, textNode);
      textNode.parentNode.insertBefore(afterComment, textNode);
      textNode.parentNode.insertBefore(textNode, afterComment);
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
          node.nodeValue.match(/^d\$i@.*$/)
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
    const match = currentNode.nodeValue.match(/^d\$i@(.*)$/);
    if (match) {
      const id = match[1];
      let nextNode = currentNode.nextSibling;

      if (nextNode && nextNode.nodeType === Node.TEXT_NODE) {
        result.push({ k: id, v: nextNode });
      } else {
        // Create a new text node, insert it after the comment, and make it the value
        const newTextNode = document.createTextNode("");
        currentNode.parentNode.insertBefore(newTextNode, nextNode);
        result.push({ k: id, v: newTextNode });
      }
    }
  }

  return result;
};
