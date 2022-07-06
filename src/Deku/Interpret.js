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

export const setPropContinuation_ = (a) => (state) => () => {
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

export const setCbContinuation_ = (a) => (state) => () => {
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

export const pursXConnectionStep_ = (tmp) => (a) => (state) => () => {
	var ptr = a.id;
	var parent = a.parent;
	var scope = a.scope;
	var pxScope = a.pxScope;
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
		// this node needs to be here because otherwise, when
		// a pursx element is looking for its parent, it won't find it
		var key = e.getAttribute("data-deku-elt-internal");
		const namespacedKey = key + pxScope;
		state.units[key + pxScope] = {
			listeners: {},
			main: e,
			scope: scope,
		};
		state.scopes[scope].push(namespacedKey);
	});
};

export const giveNewParent_ = (a) => (state) => () => {
	var ptr = a.id;
	var parent = a.parent;
	state.units[parent].main.prepend(state.units[ptr].main);
};

export const removeActualChild_ = (a) => (state) => () => {
	state.units[a.id].main.remove();
};

export const deleteFromCache_ = (a) => (state) => () => {
	// just in case
	if (state.units[a.id].remove) { state.units[a.id].remove(); }
	delete state.units[a.id];
};
