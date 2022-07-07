export const setInnerHTML_ = (t) => (elt) => () => {
	elt.innerHTML = t;
};
export const getTextNode_ = (dom) => () => {
	if (dom.childNodes.length === 1) {
		const node = document.createTextNode("");
		dom.prepend(node);
		return node;
	} else {
		for (var i = 0; i < dom.childNodes.length; i++) {
			if (
				dom.childNodes[i].nodeType === 8 &&
				dom.childNodes[i].nodeValue === ptr
			) {
				return dom.childNodes[i - 1];
			}
		}
	}
	throw new Error(
		"You think you're clever, but your hydration algorithm just threw a programming error..."
	);
};
