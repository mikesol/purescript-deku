export const setHydrating = (state) => () => {
	state.hydrating = true;
};
export const unSetHydrating = (state) => () => {
	state.hydrating = false;
};
export const attributeParent_ = (runOnJust) => (a) => (state) => () => {
	if (state.units[a.id]) {
		// only attribute if it is not attributed already
		if (!((state.units[a.id].main && state.units[a.id].main.parentNode)
			|| (state.units[a.id].startBeacon && state.units[a.id].startBeacon.parentNode))) {
			const iRan = runOnJust(a.pos)((pos) => () => {
				// when attributing,
				// we only care about positional information for
				// things with a dyn family
				// otherwise, they can't be inserted anywhere
				// other than at the back of their collection
				return runOnJust(a.dynFamily)((dynFamily) => () => {
					var i = 0;
					var j = 0;
					var terminalDyn;
					const dom = state.units[a.parent].main;
					while (j < dom.childNodes.length) {
						if (
							dom.childNodes[j].nodeType === 8 &&
							dom.childNodes[j].nodeValue === '%-%' + dynFamily
						) {
							// we have found our starting position, which is one
							// after this dyn node
							j += 1;
							break;
						}
						j++;
					}
					const inserter = (k) => {
						if (state.units[a.id].startBeacon) {
							dom.insertBefore(
								state.units[a.id].startBeacon,
								dom.childNodes[k]
							);
							dom.insertBefore(
								state.units[a.id].endBeacon,
								dom.childNodes[k]
							);
						} else {
							dom.insertBefore(
								state.units[a.id].main,
								dom.childNodes[k]
							);
						}
					}
					while (j < dom.childNodes.length) {
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
				})();
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
					// TODO: do we also need to update dkid stuff here?
					state.units[a.parent].main.parentNode.replaceChild(
						state.units[a.id].main,
						state.units[a.parent].main
					);
				} else {
					// we insert it at the end of its dyn family
					const hasADynFamily = runOnJust(a.dynFamily)((dynFamily) => () => {
						if (state.units[a.id].startBeacon) {
							state.units[a.parent].main.insertBefore(state.units[a.id].startBeacon, state.units[dynFamily].endBeacon);
							state.units[a.parent].main.insertBefore(state.units[a.id].endBeacon, state.units[dynFamily].endBeacon);
						} else {
							state.units[a.parent].main.insertBefore(state.units[a.id].main, state.units[dynFamily].endBeacon);
						}
						return true;
					})();
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
		var iterator = document.createNodeIterator(rootElem, NodeFilter.SHOW_COMMENT, filterNone, false);
		var curNode;
		while (curNode = iterator.nextNode()) {
			if (curNode.nodeValue.substring(0, 3) === '%-%') {
				state.allBeacons[curNode.nodeValue.substring(3)] = curNode;
			}
		}
	}

	getAllComments(document.documentElement);
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
			(endBeacon = state.allBeacons[`${a.id}%-%`])
		) {
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				scope: a.scope,
				pos: a.pos,
				dynFamily: a.dynFamily,
				startBeacon,
				endBeacon
			};
			startBeacon.$dekuId = ptr;
			endBeacon.$dekuId = ptr;
			return true;
		}
		return false;
	})();
	if (!iRan) {
		const startBeacon = document.createComment(`%-%${a.id}`);
		const endBeacon = document.createComment(`%-%${a.id}%-%`);
		state.units[ptr] = {
			listeners: {},
			parent: a.parent,
			dynFamily: a.dynFamily,
			scope: a.scope,
			pos: a.pos,
			startBeacon,
			endBeacon
		};
		startBeacon.$dekuId = ptr;
		endBeacon.$dekuId = ptr;
	}
}

export const getPos = (id) => (state) => () => state.units[id] && state.units[id].pos ? state.units[id].pos : (() => { throw new Error(`No positional information for ${id}`) })();
export const getDynFamily = (id) => (state) => () => state.units[id] && state.units[id].dynFamily ? state.units[id].dynFamily : (() => { throw new Error(`No positional information for ${id}`) })();
export const getParent = (id) => (state) => () => state.units[id] && state.units[id].main.parentNode && state.units[id].main.parentNode.$dekuId ? state.units[id].main.parentNode.$dekuId : (() => { throw new Error(`No parent information for ${id}`) })();
export const getScope = (id) => (state) => () => state.units[id] && state.units[id].scope ? state.units[id].scope : (() => { throw new Error(`No scope information for ${id}`) })();

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
			(dom = document.documentElement
				.querySelector(`[data-deku-ssr="${ptr}"]`)
			)
		) {
			state.units[ptr] = {
				listeners: {},
				pos: a.pos,
				parent: a.parent,
				scope: a.scope,
				dynFamily: a.dynFamily,
				main: dom,
			};
			dom.$dekuId = ptr;
			return true;
		}
		return false;
	})();
	if (!iRan) {
		const main = document.createElement(a.tag);
		state.units[ptr] = {
			listeners: {},
			parent: a.parent,
			pos: a.pos,
			scope: a.scope,
			dynFamily: a.dynFamily,
			main
		};
		main.$dekuId = ptr;
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
			(dom = document.documentElement
				// hack
				.querySelector(`[data-deku-ssr="${parent}"]`)
			)
		) {
			var i = 0;
			for (; i < dom.childNodes.length; i++) {
				const ptrSplit = ptr.split('@-@');
				if (
					dom.childNodes[i].nodeType === 8 &&
					dom.childNodes[i].nodeValue === ptrSplit[0]
				) {
					i = i - 1;
					var textWasBlank = i === -1;
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
			const main = dom.childNodes[i];
			state.units[ptr] = {
				// if we've done ssr for a text node, it will be a span,
				// so we want to get the child node
				main,
				pos: a.pos,
				parent: a.parent,
				scope: a.scope,
			};
			main.$dekuId = ptr;
			return true;
		}
		return false;
	})();
	if (!iRan) {
		const main = document.createTextNode("");
		state.units[ptr] = {
			main,
			parent: a.parent,
			scope: a.scope,
			pos: a.pos,
			dynFamily: a.dynFamily
		};
		main.$dekuId = ptr;
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
			(dom = document.documentElement
				.querySelector(`[data-deku-ssr="${ptr}"]`)
			)
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
			(dom = document.documentElement
				.querySelector(`[data-deku-ssr="${ptr}"]`)
			)
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
			(dom = document.documentElement
				.querySelector(`[data-deku-ssr="${ptr}"]`)
			)
		) {
			state.units[ptr] = {
				listeners: {},
				pos: a.pos,
				scope: scope,
				parent: parent,
				main: dom,
			};
			dom.$dekuId = ptr;
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
			pos: a.pos,
			scope: scope,
			parent: parent,
			main: tmp.firstChild,
		};
		tmp.firstChild.$dekuId = ptr;
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
	a.root.$dekuId = ptr;
};

export const giveNewParent_ = (just) => (anchorToDynBeacon) => (runOnJust) => (b) => (state) => () => {
	const runMe = []
	if (state.units[b.id] && state.units[b.id].startBeacon) {
		var c = b;
		while (c) {
			runMe.push(c);
			c = c.nextSibling;
			if (c === state.units[b.id].endBeacon) {
				break;
			}
		}
	} else {
		runMe.push(b);
	}
	for (var z = 0; z < runMe.length; z++) {
		const a = runMe[z]
		const ptr = a.id;
		const parent = a.parent;
		state.units[ptr].containingScope = a.scope;
		const iRan = runOnJust(a.pos)((aPos) => () => {
			const nodes = state.units[parent].main.childNodes;
			// todo: binary search would be faster
			var i = 0;
			var foundEqualPositions = false;
			// we always use this as an opportunity to fix up the positions
			// which is a full traversal
			// slow, and we can consider optimizing this
			// but that way, after this operation, all of the positions are guaranteed to be correct
			var pos = 0;
			while (i < nodes.length) {
				var dkid;
				if (dkid = nodes[i].$dekuId) {
					if (anchorToDynBeacon) {
						if (state.units[dkid].dynFamily !== state.units[ptr].dynFamily) {
							i++;
							continue;
						}
						// only set if not end beacon, as end beacon will have already
						// gotten the position when this iterates over the start beacon
						if (state.units[dkid].endBeacon !== nodes[i]) {
							state.units[dkid].pos = just(pos);
							pos++;
						}
						// if we've found equal positions already we stop here
						// as all we care about is the pos fixer-upper happening above
						if (foundEqualPositions) { i++; continue; }
					} else {
						// if we've found equal positions already we stop here
						// as all we care about is the pos fixer-upper happening above
						if (foundEqualPositions) { i++; continue; }
					}
					// if the positions are equal, insert before and return true
					foundEqualPositions = runOnJust(state.units[dkid].pos)((pos2) => () => {
						if (pos2 === aPos) {
							state.units[parent].main.insertBefore(state.units[ptr].main, nodes[i]);
							// increment pos by one as there's been an insert
							pos++;
							return true;
						}
						// positions are not equal, so false
						return false;
					})();
					// if true, that means we called insert before, return true to break the loop
				}
				i++;
			}
			if (foundEqualPositions) { return true; };
			// we return true anyway, as this just means that we can tack this onto the end of our structure
			state.units[parent].main.appendChild(state.units[ptr].main);
			return true;
		})();
		if (!iRan) {
			state.units[parent].main.appendChild(state.units[ptr].main);
		}
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

export const removeDynBeacon_ = deleteFromCache_;
