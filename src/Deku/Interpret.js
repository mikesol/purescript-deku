const connectXToY_ = (x, y, state) => {
	if (y === "@portal@") {
		return;
	}
	state.units[y].main.appendChild(state.units[x].main);
};

export const makeElement_ = (tryHydration) => (a) => (state) => () => {
	var dom;
	var ptr = a.id;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	if (tryHydration && (dom = document.getElementById(ptr))) {
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
		connectXToY_(ptr, a.parent, state);
	}
};
export const makeText_ = (tryHydration) => (a) => (state) => () => {
	var ptr = a.id;
	var dom;
	if (!state.scopes[a.scope]) {
		state.scopes[a.scope] = [];
	}
	state.scopes[a.scope].push(ptr);
	if (tryHydration && (dom = document.getElementById(ptr))) {
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
		connectXToY_(ptr, a.parent, state);
	}
};

export function makeFFIDOMSnapshot() {
	return {
		units: {},
		scopes: {},
	};
}

export const setProp_ = (a) => (state) => () => {
	var ptr = a.id;
	var avv = a.value;
	if (state.units[ptr].main.tagName === "INPUT" && a.key === "value") {
		state.units[ptr].main.value = avv;
	} else if (state.units[ptr].main.tagName === "INPUT" && a.key === "checked") {
		state.units[ptr].main.checked = avv === "true";
	} else {
		state.units[ptr].main.setAttribute(a.key, avv);
	}
};

export const setCb_ = (a) => (state) => () => {
	var ptr = a.id;
	var avv = a.value;
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

export const makePursx_ = (tryHydration) => (a) => (state) => () => {
	var dom;
	var tmp;
	var ptr = a.id;
	var html = a.html;
	var verb = a.verb;
	var cache = a.cache;
	var parent = a.parent;
	var scope = a.scope;
	if (tryHydration && (dom = document.getElementById(ptr))) {
		state.units[ptr] = {
			listeners: {},
			scope: a.dkScope,
			parent: parent,
			main: dom.childNodes[0],
		};
	} else {
		var entries = Object.entries(cache);
		for (var i = 0; i < entries.length; i++) {
			var key = entries[i][0];
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
			scope: a.dkScope,
			parent: parent,
			main: tmp.firstChild,
		};
	}
	if (!state.scopes[a.dkScope]) {
		state.scopes[a.dkScope] = [];
	}
	// we were hydrating if tmp is not defined
	if (!tmp) {
		tmp = dom;
	}
	state.scopes[a.dkScope].push(ptr);
	tmp.querySelectorAll("[data-deku-attr-internal]").forEach(function (e) {
		var key = e.getAttribute("data-deku-attr-internal");
		state.units[key + scope] = {
			listeners: {},
			main: e,
			scope: a.dkScope,
		};
		state.scopes[a.dkScope].push(key + scope);
	});
	tmp.querySelectorAll("[data-deku-elt-internal]").forEach(function (e) {
		var key = e.getAttribute("data-deku-elt-internal");
		state.units[key + scope] = {
			listeners: {},
			main: e,
			scope: a.dkScope,
		};
		state.scopes[a.dkScope].push(key + scope);
	});
	if (!dom) {
		connectXToY_(ptr, parent, state);
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
		state.units[ptr].containingScope !== a.scope
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
