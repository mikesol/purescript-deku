var makeid = function (length) {
	var result = "";
	var characters =
		"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	var charactersLength = characters.length;
	for (var i = 0; i < length; i++) {
		result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
	return result;
};

var connectXToY_ = function (x) {
	return function (y) {
		return function (state) {
			return function () {
				if (y === "@portal@") {
					return;
				}
				state.units[y].main.appendChild(state.units[x].main);
			};
		};
	};
};

export function renderDOM(arrayToApply) {
	return function () {
		for (var i = 0; i < arrayToApply.length; i++) {
			arrayToApply[i]();
		}
	};
}

export function makeElement_ (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			if (!state.scopes[a.scope]) {
				state.scopes[a.scope] = [];
			}
			state.scopes[a.scope].push(ptr);
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				scope: a.scope,
				main: document.createElement(a.tag),
			};
			if (a.parent === state.terminus) {
				state.terminalPtrs.push(a.id);
			}
			connectXToY_(ptr)(a.parent)(state)();
		};
	};
};

export function makeText_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			if (!state.scopes[a.scope]) {
				state.scopes[a.scope] = [];
			}
			state.scopes[a.scope].push(ptr);
			state.units[ptr] = {
				main: document.createTextNode(""),
				parent: a.parent,
				scope: a.scope,
			};
			connectXToY_(ptr)(a.parent)(state)();
		};
	};
}

export function makeFFIDOMSnapshot() {
	return {
		units: {},
		scopes: {},
		unqidfr: makeid(10),
	};
}

export function setProp_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var avv = a.value;
			if (state.units[ptr].main.tagName === "INPUT" && a.key === "value") {
				state.units[ptr].main.value = avv;
			} else if (
				state.units[ptr].main.tagName === "INPUT" &&
				a.key === "checked"
			) {
				state.units[ptr].main.checked = avv === "true";
			} else {
				state.units[ptr].main.setAttribute(a.key, avv);
			}
		};
	};
}

export function setCb_(a) {
	return function (state) {
		return function () {
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
	};
}

export function setText_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr].main.nodeValue = a.text; //.replace(/\n/g, "<br>");
		};
	};
}

var makePursx_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var html = a.html;
			var verb = a.verb;
			var cache = a.cache;
			var parent = a.parent;
			var scope = a.scope;
			if (a.parent === state.terminus) {
				state.terminalPtrs.push(a.id);
			}
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
			var tmp = document.createElement("div");
			tmp.innerHTML = html.trim();
			if (!state.scopes[a.dkScope]) {
				state.scopes[a.dkScope] = [];
			}
			state.scopes[a.dkScope].push(ptr);
			state.units[ptr] = {
				listeners: {},
				scope: a.dkScope,
				parent: parent,
				main: tmp.firstChild,
			};
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
			connectXToY_(ptr)(parent)(state)();
		};
	};
};
export { makePursx_ };

export function makeRoot_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				main: a.root,
			};
		};
	};
}

export function makeNoop_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				noop: true,
			};
		};
	};
}

export function giveNewParent_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var parent = a.parent;
			state.units[ptr].containingScope = a.scope;
			state.units[parent].main.prepend(state.units[ptr].main);
		};
	};
}

export function disconnectElement_(a) {
	return function (state) {
		return function () {
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
	};
}

export function deleteFromCache_(a) {
	return function (state) {
		return function () {
			delete state.units[a.id];
		};
	};
}

export function sendToTop_(a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr].main.parentNode.prepend(state.units[ptr].main);
		};
	};
}
