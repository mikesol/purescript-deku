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
				state.units[y].main.appendChild(state.units[x].main);
			};
		};
	};
};

var disconnectXFromY_ = function (x) {
	return function (y) {
		return function (state) {
			return function () {
				state.units[y].main.removeChild(state.units[x].main);
			};
		};
	};
};
exports.renderDOM = function (arrayToApply) {
	return function () {
		for (var i = 0; i < arrayToApply.length; i++) {
			arrayToApply[i]();
		}
	};
};
var makeElement = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				listeners: {},
				parent: a.parent,
				main: document.createElement(a.tag),
			};
			if (a.parent === state.terminus) {
				state.terminalPtrs.push(a.id);
			}
			connectXToY_(ptr)(a.parent)(state)();
		};
	};
};
exports.makeElement = makeElement;
exports.makeText_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				main: document.createTextNode(""),
				parent: a.parent,
			};
			connectXToY_(ptr)(a.parent)(state)();
		};
	};
};
exports.makeFFIDOMSnapshot = function () {
	return {
		units: {},
		portals: {},
		unqidfr: makeid(10),
		terminalPtrs: [],
	};
};
exports.setAttribute_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var avv = a.value.value;
			if (a.value.type === "cb") {
				if (a.key === "@canvas-hack@") {
					const cxt = state.units[ptr].main.getContext("2d");
					avv(cxt)();
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
			} else {
				if (state.units[ptr].main.tagName === "INPUT" && a.key === "value") {
					state.units[ptr].main.value = avv;
				} else if (state.units[ptr].main.tagName === "INPUT" && a.key === "checked") {
					state.units[ptr].main.checked = avv === "true" ;
				} else {
					state.units[ptr].main.setAttribute(a.key, avv);
				}
			}
		};
	};
};
exports.setText_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr].main.nodeValue = a.text; //.replace(/\n/g, "<br>");
		};
	};
};

exports.makeSubgraph = function (ptr) {
	return function (parent) {
		return function (sceneM) {
			return function (state) {
				return function () {
					var children = {};
					var unsu = {};
					state.units[ptr] = {
						parent: parent,
						sceneM: sceneM,
						children: children,
						unsu: unsu,
					};
				};
			};
		};
	};
};

exports.removeSubgraph = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var j = a.pos;
			var children = state.units[ptr].children;
			var unsu = state.units[ptr].unsu;
			if (children[j] === undefined) {
				return;
			}
			for (var k = 0; k < children[j].terminalPtrs.length; k++) {
				disconnectXFromY_(children[j].terminalPtrs[k])(state.units[ptr].parent)(
					children[j]
				)();
			}
			// unsubscribe
			unsu[j]();
			// delete unused
			delete children[j];
			delete unsu[j];
		};
	};
};

var insertSubgraph = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var j = a.pos;
			var index = a.index;
			var children = state.units[ptr].children;
			var unsu = state.units[ptr].unsu;
			var needsConnecting = false;
			if (unsu[j] === undefined) {
				children[j] = {
					units: {},
					portals: state.portals,
					terminus: state.units[ptr].parent,
					unqidfr: makeid(10),
					parent: ptr,
					terminalPtrs: [],
				};
				children[j].units[state.units[ptr].parent] =
					state.units[state.units[ptr].parent];
				var sg = state.units[ptr].sceneM(index)();
				unsu[j] = sg.actualized(
					(
						(jIs) => (instr) => () =>
							instr(children[jIs])()
					)(j)
				)();
				needsConnecting = true;
			}
			if (needsConnecting) {
				for (var k = 0; k < children[j].terminalPtrs.length; k++) {
					connectXToY_(children[j].terminalPtrs[k])(state.units[ptr].parent)(
						children[j]
					)();
				}
			}
		};
	};
};
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
			state.units[ptr] = {
				listeners: {},
				parent: parent,
				main: tmp.firstChild,
			};
			tmp.querySelectorAll("[data-deku-attr-internal]").forEach(function (e) {
				var key = e.getAttribute("data-deku-attr-internal");
				state.units[key+scope] = {
					listeners: {},
					main: e,
				};
			});
			tmp.querySelectorAll("[data-deku-elt-internal]").forEach(function (e) {
				var key = e.getAttribute("data-deku-elt-internal");
				state.units[key+scope] = {
					listeners: {},
					main: e,
				};
			});
			connectXToY_(ptr)(parent)(state)();
		};
	};
};
exports.makePursx_ = makePursx_;
exports.insertSubgraph = insertSubgraph;
exports.sendSubgraphToTop_ = function (a) {
	return function (state) {
		return function () {
			var child = state.units[a.id].children[a.pos];
			if (child === undefined) {
				return;
			}
			var l = child.terminalPtrs.length;
			for (var i = 0; i < child.terminalPtrs.length; i++) {
				state.units[state.units[a.id].parent].main.prepend(
					child.units[child.terminalPtrs[l - i - 1]].main
				);
			}
		};
	};
};
exports.makeRoot_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				main: a.root,
			};
		};
	};
};
exports.makePortal_ = function (a) {
	return function (state) {
		return function () {
			var main = document.createElement("div");
			state.portals[a.id] = {
				main: main,
			};
			state.units[a.id] = {
				main: main,
			};
			main.setAttribute("style", "display:contents;");
		};
	};
};
exports.makeGateway_ = function (a) {
	return function (state) {
		return function () {
			var main = document.createElement("div");
			state.units[a.id] = {
				main: main,
				portal: a.portal
			};
			main.setAttribute("style", "display:contents;");
			connectXToY_(a.id)(a.parent)(state)();
		};
	};
};
exports.setPortal_ = function (a) {
	return function(state) {
		return function() {
			if (a.on) {
				state.units[a.id].main.prepend(state.portals[state.units[a.id].portal].main);
			} else {
				state.units[a.id].main.innerHTML = "";
			}
		}
	}
};
