export const setHydrating = (state) => () => {
	state.hydrating = true;
};
export const unSetHydrating = (state) => () => {
	state.hydrating = false;
};
export const attributeParent_ = (runOnJust) => (a) => (state) => () => {
	if (state.units[a.id]) {
		// only attribute if it is not attributed already
		if (!state.units[a.id].main.parentNode) {
			const iRan = runOnJust(a.pos)((pos) => () => {
				// when attributing,
				// we only care about positional information for
				// things with a dyn family
				// otherwise, they can't be inserted anywhere
				// other than at the back of their collection
				return runOnJust(a.dynFamily)((dynFamily) => {
					var i = 0;
					var j = 0;
					var terminalDyn;
					while (j < state.units[a.parent].main.childNodes.length) {
						if (
							dom.childNodes[j].nodeType === 8 &&
							dom.childNodes[j].nodeValue === '%-%' + dynFamily
						) {
							// we have found our starting position, which is one
							// after this dyn node
							j += 1;
							break;
						}
					}
					const inserter = (k) => {
						if (state.units[a.id].startBeacon) {
							state.units[a.parent].main.insertBefore(
								state.units[a.id].startBeacon,
								state.units[a.parent].main.childNodes[k]
							);
							state.units[a.parent].main.insertBefore(
								state.units[a.id].endBeacon,
								state.units[a.parent].main.childNodes[k]
							);
						} else {
							state.units[a.parent].main.insertBefore(
								state.units[a.id].main,
								state.units[a.parent].main.childNodes[k]
							);
						}
					}
					while (j < state.units[a.parent].main.childNodes.length) {
						if (i === pos) {
							inserter(j);
							return true;
						} if (
							dom.childNodes[j].nodeType === 8 &&
							dom.childNodes[j].nodeValue === '%-%' + dynFamily + '%-%'
						) {
							// we have hit the end
							// insert here
							inserter(j);
							return true;
						}
						// we are starting a dynamic bloc
						// suspend incrementing until we hit its end
						if (
							dom.childNodes[j].nodeType === 8 &&
							dom.childNodes[j].nodeValue.substring(0, 3) === '%-%' &&
							!terminalDyn
						) {
							terminalDyn = dom.childNodes[j].nodeValue + '%-%';
						}
						// we are not in a dynamic bloc, increment normally
						if (!terminalDyn) {
							i++;
						}
						// we are ending a dynamic bloc and we can safely increment now
						if (
							dom.childNodes[j].nodeType === 8 &&
							dom.childNodes[j].nodeValue === terminalDyn
						) {
							terminalDyn = undefined;
							i++;
						}
						j++;
					}
					return false;
				});
			})();
			if (!iRan) {
				// this is a pursx child element
				// pursx children will _never_ have positional information
				// as they are one-offs in the pursx tree
				// however, the way that makePursX is done, there is a thin
				// wrapper node created around the main node
				// the way we solve that in this function is to replace the
				// wrapper with its child.
				if (a.parent.indexOf("@!%") !== -1) {
					state.units[a.parent].main.parentNode.replaceChild(
						state.units[a.id].main,
						state.units[a.parent].main
					);
				} else {
					// we insert it at the end of its dyn family
					const hasADynFamily = runOnJust(a.dynFamily)((dynFamily) => {
						if (state.units[a.id].startBeacon) {
							state.units[a.parent].main.insertBefore(state.units[a.id].startBeacon, state.units[dynFamily].endBeacon);
							state.units[a.parent].main.insertBefore(state.units[a.id].endBeacon, state.units[dynFamily].endBeacon);
						} else {
							state.units[a.parent].main.insertBefore(state.units[a.id].main, state.units[dynFamily].endBeacon);
						}
					});
					// vanilla node inserting. no need to do any fancy positional stuff
					// we just tack it on to the end
					if (!hasADynFamily) {
						if (state.units[a.id].startBeacon) {
							state.units[a.parent].main.appendChild(state.units[a.id].startBeacon);
							state.units[a.parent].main.appendChild(state.units[a.id].endBeacon);
						} else {
							state.units[a.parent].main.appendChild(state.units[a.id].main);
						}
					}
				}
			}
		}
	}
};
export const getAllComments = (state) => () => {
	function filterNone() {
		return NodeFilter.FILTER_ACCEPT;
	}

	function getAllComments(rootElem) {
		// Fourth argument, which is actually obsolete according to the DOM4 standard, is required in IE 11
		var iterator = document.createNodeIterator(rootElem, NodeFilter.SHOW_COMMENT, filterNone, false);
		var curNode;
		while (curNode = iterator.nextNode()) {
			if (curNode.value.substring(0, 3) === '%-%')
				allBeacons[curNode.value.substring(3)] = curNode;
		}
		return comments;
	}

	getAllComments(document.body);
}
export const makeDynBeacon_ = (runOnJust) => (tryHydration) => (a) => (state) => () => {
	var startBeacon;
	var endBeacon;
	var ptr = a.id;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	// note that, for portals, this will be broken in its current form
	const iRan = runOnJust(a.parent)(() => () => {
		if (
			state.hydrating &&
			tryHydration &&
			(startBeacon = state.allBeacons[a.id]) &&
			(endBeacon = state.allBeacons[`${a.id}'%-%'`])
		) {
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				scope: a.scope,
				startBeacon,
				endBeacon
			};
			return true;
		}
		return false;
	})();
	if (!iRan) {
		state.units[ptr] = {
			listeners: {},
			parent: a.parent,
			scope: a.scope,
			startBeacon: document.createComment(`%-%${id}`),
			endBeacon: document.createComment(`%-%${id}%-%`),
		};
	}
}

export const removeDynBeacon_ = deleteFromCache_;

export const makeElement_ = (runOnJust) => (tryHydration) => (a) => (state) => () => {
	var dom;
	var ptr = a.id;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	// note that, for portals, this will be broken in its current form
	const iRan = runOnJust(a.parent)(() => () => {
		if (
			state.hydrating &&
			tryHydration &&
			(dom = document.body
				.querySelectorAll("[data-deku-ssr-" + ptr + "]")
				.item(0))
		) {
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				scope: a.scope,
				dynFamily: a.dynFamily,
				main: dom,
			};
			return true;
		}
		return false;
	})();
	if (!iRan) {
		state.units[ptr] = {
			listeners: {},
			parent: a.parent,
			scope: a.scope,
			dynFamily: a.dynFamily,
			main: document.createElement(a.tag),
		};
	}
};

export const makeText_ = (runOnJust) => (tryHydration) => (maybe) => (a) => (state) => () => {
	var ptr = a.id;
	var dom;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	// for SSR, we need a parent, otherwise we cannot get the child node
	// note that, for portals, this will be broken in its current form
	const iRan = runOnJust(a.parent)((parent) => () => {
		if (
			state.hydrating &&
			tryHydration &&
			// hack
			(dom = document.body
				// hack
				.querySelectorAll("[data-deku-ssr-" + parent + "]")
				.item(0))
		) {

			var i = 0;
			for (; i < dom.childNodes.length; i++) {
				const ptrSplit = ptr.split('@-@');
				if (
					dom.childNodes[i].nodeType === 8 &&
					dom.childNodes[i].nodeValue === ptrSplit[0]
				) {
					i = i - 1;
					var textWasBlank = i === 0;
					var textWasBlankAfterDynBeacon = dom.childNodes[i].nodeType === 8;
					if (textWasBlank) {
						dom.prepend(document.createTextNode(""));
					}
					if (textWasBlankAfterDynBeacon) {
						dom.insertBefore(document.createTextNode(""), dom.childNodes[i + 1]);
					}
					break;
				}
			}

			state.units[ptr] = {
				// if we've done ssr for a text node, it will be a span,
				// so we want to get the child node
				main: dom.childNodes[i],
				parent: a.parent,
				scope: a.scope,
			};
			return true;
		}
		return false;
	})();
	if (!iRan) {
		state.units[ptr] = {
			main: document.createTextNode(""),
			parent: a.parent,
			scope: a.scope,
			dynFamily: a.dynFamily
		};
	}
};

export function makeFFIDOMSnapshot() {
	return {
		units: {},
		scopes: {},
		allBeacons: {}
	};
}

export const setProp_ = (tryHydration) => (a) => (state) => () => {
	if (state.units[a.id]) {

		var ptr = a.id;
		var avv = a.value;
		// it may be the case that we have created an element via
		// pursx but not added it to the global state yet
		if (
			state.hydrating &&
			tryHydration &&
			!state.units[ptr] &&
			(dom = document.body
				.querySelectorAll("[data-deku-ssr-" + ptr + "]")
				.item(0))
		) {
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				scope: a.scope,
				main: dom,
			};
			if (!state.scopes[a.scope]) {
				state.scopes[a.scope] = [];
			}
			state.scopes[a.scope].push(ptr);
		}
		if (state.units[ptr].main.tagName === "INPUT" && a.key === "value") {
			state.units[ptr].main.value = avv;
		} else if (state.units[ptr].main.tagName === "INPUT" && a.key === "checked") {
			state.units[ptr].main.checked = avv === "true";
		} else if (a.key === "disabled") {
			state.units[ptr].main.disabled = avv === "true";
		} else {
			state.units[ptr].main.setAttribute(a.key, avv);
		}
	}
};

export const setCb_ = (tryHydration) => (a) => (state) => () => {
	if (state.units[a.id]) {

		var ptr = a.id;
		var avv = a.value;
		// it may be the case that we have created an element via
		// pursx but not added it to the global state yet
		if (
			state.hydrating &&
			tryHydration &&
			!state.units[ptr] &&
			(dom = document.body
				.querySelectorAll("[data-deku-ssr-" + ptr + "]")
				.item(0))
		) {
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				scope: a.scope,
				main: dom,
			};
			if (!state.scopes[a.scope]) {
				state.scopes[a.scope] = [];
			}
			state.scopes[a.scope].push(ptr);
		}
		if (a.key === "@self@") {
			avv(state.units[ptr].main)();
		} else {
			if (state.units[ptr].listeners[a.key]) {
				state.units[ptr].main.removeEventListener(
					a.key,
					state.units[ptr].listeners[a.key]
				);
			}
			var el = (e) => avv(e)();
			state.units[ptr].main.addEventListener(a.key, el);
			state.units[ptr].listeners[a.key] = el;
		}
	}
};

export const setText_ = (a) => (state) => () => {
	if (state.units[a.id]) {

		var ptr = a.id;
		state.units[ptr].main.nodeValue = a.text;
	}
};

export const makePursx_ = (runOnJust) => (tryHydration) => (maybe) => (a) => (state) => () => {
	var dom;
	var tmp;
	var ptr = a.id;
	var html = a.html;
	var verb = a.verb;
	var cache = a.cache;
	var parent = a.parent;
	var scope = a.scope;
	var pxScope = a.pxScope;
	// note that, for portals, this will be broken in its current form
	const iRan = runOnJust(a.parent)(() => () => {
		if (
			state.hydrating &&
			tryHydration &&
			// hack
			(dom = document.body
				.querySelectorAll("[data-deku-ssr-" + ptr + "]")
				.item(0))
		) {
			state.units[ptr] = {
				listeners: {},
				scope: scope,
				parent: parent,
				main: dom,
			};
			return true;
		}
		return false;
	})();
	if (!iRan) {
		const entries = Object.entries(cache);
		for (var i = 0; i < entries.length; i++) {
			const key = entries[i][0];
			if (entries[i][1] === true) {
				// it is an attribute
				html = html.replace(
					verb + key + verb,
					"data-deku-attr-internal=" + '"' + key + '"'
				);
			} else {
				html = html.replace(
					verb + key + verb,
					'<span style="display:contents;" data-deku-elt-internal=' +
					'"' +
					key +
					'"></span>'
				);
			}
		}
		tmp = document.createElement("div");
		tmp.innerHTML = html.trim();
		state.units[ptr] = {
			listeners: {},
			scope: scope,
			parent: parent,
			main: tmp.firstChild,
		};
	}
	if (!state.scopes[scope]) {
		state.scopes[scope] = [];
	}
	state.scopes[scope].push(ptr);
	// we were hydrating if tmp is not defined
	if (!tmp) {
		// need to test if this will work in all cases! especially when we're setting
		// attributes of the top-level element
		tmp = dom;
	}
	tmp.querySelectorAll("[data-deku-attr-internal]").forEach(function (e) {
		var key = e.getAttribute("data-deku-attr-internal");
		// each individual unit has the name of the key plus its scope
		// this is necessary to avoid namespacing conflicts
		// in case multiple purs-x contain the same key
		const namespacedKey = key + "@!%" + pxScope;
		state.units[namespacedKey] = {
			listeners: {},
			main: e,
			scope: scope,
		};
		state.scopes[scope].push(namespacedKey);
	});
	tmp.querySelectorAll("[data-deku-elt-internal]").forEach(function (e) {
		var key = e.getAttribute("data-deku-elt-internal");
		const namespacedKey = key + "@!%" + pxScope;
		state.units[key + "@!%" + pxScope] = {
			listeners: {},
			main: e,
			scope: scope,
		};
		state.scopes[scope].push(namespacedKey);
	});
};

export const makeRoot_ = (a) => (state) => () => {
	var ptr = a.id;
	state.units[ptr] = {
		main: a.root,
	};
};

// this is called whenever we are in a portal situation
// the basic issue we're up against, which at the moment has no answer,
// is how to preserve positional information
/**
 * portal (text_ "foo") \t ->
 *   D.div_ [text_ "bar", envy $ (delay 1.0) (pure t), text_ "baz"]
 */
// In the current code base, `t` will wind up at the bottom of the list, but we
// don't want that.
// We somehow need to get `t` between "bar" and "baz".
// This is complicated by the fact that,
// in the vast majority of cases, positional information will not matter.
// There will be a list of items, and we'll just append them to the parent
// one by one. Cnstantly working with positional information will slow apps down
// considerably, and we don't want to optimize for the corner cases.
// Ideally, we'll stash the position for a rainy day and
// only use it in dynamic isituations like portal, where we can afford
// the more expensive operation because there are likely less of them.
export const giveNewParent_ = (a) => (state) => () => {
	if (state.units[a.id] && state.units[a.id].main) {
		var ptr = a.id;
		var parent = a.parent;
		state.units[ptr].containingScope = a.scope;
		state.units[parent].main.prepend(state.units[ptr].main);
	}
	if (state.units[a.id] && state.units[a.id].startBeacon) {
		var ptr = a.id;
		var parent = a.parent;
		state.units[ptr].containingScope = a.scope;
		state.units[parent].main.prepend(state.units[ptr].main);
	}
};

export const disconnectElement_ = (a) => (state) => () => {
	if (state.units[a.id]) {
		var ptr = a.id;
		if (
			state.units[ptr].containingScope &&
			!a.scopeEq(state.units[ptr].containingScope)(a.scope)
		) {
			return;
		}

		state.units[ptr].main.remove();
	}
};

export const deleteFromCache_ = (a) => (state) => () => {
	if (state.units[a.id]) {
		delete state.units[a.id];
	}
};

export const sendToPos_ = (a) => (state) => () => {
	if (state.units[a.id]) {
		var ptr = a.id;
		var pos = a.pos;
		var parent = state.units[ptr].main.parentNode;
		parent.insertBefore(
			state.units[ptr].main,
			parent.children.length <= pos
				? parent.children[parent.children.length - 1]
				: pos < 0
					? parent.children[0]
					: parent.children[pos]
		);
	}
};
