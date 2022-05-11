const connectXToY_ = (maybe, x, y$, state) => {
	maybe((y) => state.units[y].main.appendChild(state.units[x].main))(y$);
};

export const makeElement_ = (tryHydration) => (maybe) => (a) => (state) => () => {
	var dom;
	var ptr = a.id;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	// note that, for portals, this will be broken in its current form
	if (
		tryHydration &&
		a.parent !== "@portal@" &&
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
	} else {
		state.units[ptr] = {
			listeners: {},
			parent: a.parent,
			scope: a.scope,
			main: document.createElement(a.tag),
		};
		connectXToY_(maybe, ptr, a.parent, state);
	}
};
export const makeText_ = (tryHydration) => (maybe) => (a) => (state) => () => {
	var ptr = a.id;
	var dom;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	// for SSR, we need a parent, otherwise we cannot get the child node
	// note that, for portals, this will be broken in its current form
	if (
		tryHydration &&
		a.parent !== "@portal@" &&
		(dom = document.body
			.querySelectorAll("[data-deku-ssr-" + a.parent + "]")
			.item(0))
	) {
		state.units[ptr] = {
			// if we've done ssr for a text node, it will be a span,
			// so we want to get the child node
			main: dom.childNodes[0],
			parent: a.parent,
			scope: a.scope,
		};
	} else {
		state.units[ptr] = {
			main: document.createTextNode(""),
			parent: a.parent,
			scope: a.scope,
		};
		connectXToY_(maybe, ptr, a.parent, state);
	}
};

export function makeFFIDOMSnapshot() {
	return {
		units: {},
		scopes: {},
	};
}

export const setProp_ = (tryHydration) => (a) => (state) => () => {
	var ptr = a.id;
	var avv = a.value;
	// it may be the case that we have created an element via
	// pursx but not added it to the global state yet
	if (
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
	} else {
		state.units[ptr].main.setAttribute(a.key, avv);
	}
};

export const setCb_ = (tryHydration) => (a) => (state) => () => {
	var ptr = a.id;
	var avv = a.value;
	// it may be the case that we have created an element via
	// pursx but not added it to the global state yet
	if (
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
};

export const setText_ = (a) => (state) => () => {
	var ptr = a.id;
	state.units[ptr].main.nodeValue = a.text;
};

export const makePursx_ = (tryHydration) => (maybe) => (a) => (state) => () => {
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
	if (
		tryHydration &&
		parent !== "@portal@" &&
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
	} else {
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
		const namespacedKey = key + pxScope;
		state.units[namespacedKey] = {
			listeners: {},
			main: e,
			scope: scope,
		};
		state.scopes[scope].push(namespacedKey);
	});
	tmp.querySelectorAll("[data-deku-elt-internal]").forEach(function (e) {
		var key = e.getAttribute("data-deku-elt-internal");
		const namespacedKey = key + pxScope;
		state.units[key + pxScope] = {
			listeners: {},
			main: e,
			scope: scope,
		};
		state.scopes[scope].push(namespacedKey);
	});
	if (!dom) {
		connectXToY_(maybe, ptr, parent, state);
	}
};

export const makeRoot_ = (a) => (state) => () => {
	var ptr = a.id;
	state.units[ptr] = {
		main: a.root,
	};
};

export const giveNewParent_ = (a) => (state) => () => {
	var ptr = a.id;
	var parent = a.parent;
	state.units[ptr].containingScope = a.scope;
	state.units[parent].main.prepend(state.units[ptr].main);
};

export const disconnectElement_ = (a) => (state) => () => {
	var ptr = a.id;
	if (state.units[ptr].noop) {
		return;
	}
	if (
		state.units[ptr].containingScope &&
		!(a.scopeEq(state.units[ptr].containingScope)(a.scope))
	) {
		return;
	}

	state.units[ptr].main.remove();
};

export const deleteFromCache_ = (a) => (state) => () => {
	delete state.units[a.id];
};

export const sendToTop_ = (a) => (state) => () => {
	var ptr = a.id;
	state.units[ptr].main.parentNode.prepend(state.units[ptr].main);
};
