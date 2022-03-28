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
		return function (stateX) {
			return function (stateY) {
				return function () {
					stateY.units[y].main.appendChild(stateX.units[x].main);
				};
			};
		};
	};
};

exports.connectXToY_ = connectXToY_;
var disconnectXFromY_ = function (x) {
	return function (y) {
		return function (stateX) {
			return function (stateY) {
				return function () {
					stateY.units[y].main.removeChild(stateX.units[x].main);
				};
			};
		};
	};
};
exports.disconnectXFromY_ = disconnectXFromY_;
exports.destroyUnit_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			delete state.units[ptr];
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
var makeElement_ = function (eltAlreadyExists) {
	return function (a) {
		return function (state) {
			return function () {
				var ptr = a.id;
				state.units[ptr] = {
					listeners: {},
					main: eltAlreadyExists
						? eltAlreadyExists
						: document.createElement(a.tag),
				};
				connectXToY_(ptr)(a.parent)(state)(state)();
			};
		};
	};
};
exports.makeElement_ = makeElement_(undefined);
exports.makeText_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				main: document.createElement("span"),
			};
			state.units[ptr].main.setAttribute("style", "white-space: pre-wrap;");
			connectXToY_(ptr)(a.parent)(state)(state)();
		};
	};
};
exports.makeFFIDOMSnapshot = function () {
	return {
		units: {},
		unqidfr: makeid(10),
	};
};
exports.setAttribute_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			var avv = a.value.value;
			if (a.value.type === "cb") {
				if (state.units[ptr].listeners[a.key]) {
					state.units[ptr].main.removeEventListener(
						a.key,
						state.units[ptr].listeners[a.key]
					);
				}
				var el = (e) => avv(e)();
				state.units[ptr].main.addEventListener(a.key, el);
				state.units[ptr].listeners[a.key] = el;
			} else {
				if (state.units[ptr].main.tagName === "INPUT" && a.key === "value") {
					state.units[ptr].main.value = avv;
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
			state.units[ptr].main.innerHTML = a.text
				.replace(/\n/g, "<br>")
				.replace(/ /g, "&nbsp;");
		};
	};
};
var doSortingOnSubgraphs = function (unit, sorting) {
	for (var i = 0; i < sorting.length; i++) {
		var sl = unit.children[sorting[i][0]].terminalPtrs.length;
		for (var k = 0; k < sl; k++) {
			unit.main.prepend(
				unit.children[sorting[i][0]].units[
					unit.children[sorting[i][0]].terminalPtrs[sl - k - 1]
				].main
			);
		}
	}
};

// foreign i
exports.makeSubgraph_ = function (ptr) {
	return function (sceneM) {
		return function (funkyFx) {
			return function (state) {
				return function () {
					var children = {};
					var scenes = {};
					var funk = {};
					var unsu = {};
					state.units[ptr] = {
						sceneM: sceneM,
						main: document.createElement("div"),
						funkyFx: funkyFx,
						isSubgraph: true,
						scenes: scenes,
						children: children,
						funk: funk,
						unsu: unsu,
					};
					state.units[ptr].main.setAttribute("style", "display:contents;");
				};
			};
		};
	};
};
exports.identifyAsTerminus_ = function (a) {
	return function (state) {
		return function () {
			state.terminus = a.id;
		};
	};
};
// mport makeSubgraph_
//   :: forall index env push scene
//    . String
//   -- this is the generic function for how to interpret a scene
//   -> ( index
//        -> (push -> Effect Unit)
//        -> Event (Either env push)
//        -> Element FFIDOMSnapshot (Effect Unit)
//      )
//   -> ( Int
//        -> index
//        -> Effect (Element' FFIDOMSnapshot (Effect Unit))
//      )
//   -> FFIDOMSnapshot
//   -> Effect Unit

var setSubgraph_ = function (ptr) {
	return function (envs) {
		return function (state) {
			return function () {
				var scenes = state.units[ptr].scenes;
				var children = state.units[ptr].children;
				var funk = state.units[ptr].funk;
				var unsu = state.units[ptr].unsu;
				var needsConnecting = [];
				for (var i = 0; i < envs.length; i++) {
					var j = envs[i].pos;
					if (envs[i].env === null && scenes[j] === undefined) {
					} else if (envs[i].env !== null && scenes[j] !== undefined) {
					} else if (envs[i].env !== null && scenes[j] === undefined) {
						children[j] = {
							units: {},
							unqidfr: makeid(10),
							parent: state,
						};
						scenes[j] = state.units[ptr].sceneM(envs[i].index);
						var funkworthy = state.units[ptr].funkyFx(j)(envs[i].index)();
						funk[j] = funkworthy.loop;
						unsu[j] = funkworthy.unsubscribe;
						needsConnecting.push(j);
					} else {
						for (var k = 0; k < children[j].terminalPtrs.length; k++) {
							disconnectXFromY_(children[j].terminalPtrs[k])(ptr)(children[j])(
								state
							)();
						}
						// unsubscribe
						unsu[j]();
						// delete unused
						delete scenes[j];
						delete children[j];
						delete funk[j];
						delete unsu[j];
					}
				}
				var sortable = [];
				var needsSorting = false;
				for (var m = 0; m < envs.length; m++) {
					if (envs[m].env === null) {
						continue;
					}
					var i = envs[m].pos;
					var applied = funk[i](envs[m].env)(scenes[i]);
					for (var j = 0; j < applied.instructions.length; j++) {
						// thunk
						applied.instructions[j](children[i])();
					}
					needsSorting = needsSorting || applied.forOrdering !== 0;
					sortable.push([i, applied.forOrdering]);
					scenes[i] = applied.nextScene;
				}
				if (needsSorting) {
					sortable.sort((a, b) => b[1] - a[1]);
					doSortingOnSubgraphs(state.units[ptr], sortable);
				} else {
					for (var i = 0; i < needsConnecting.length; i++) {
						var j = needsConnecting[i];
						for (var k = 0; k < children[j].terminalPtrs.length; k++) {
							connectXToY_(children[j].terminalPtrs[k])(ptr)(children[j])(
								state
							)();
						}
					}
				}
			};
		};
	};
};
var makePursx_ = function ($massiveCreate) {
	return function (a) {
		return function (state) {
			return function () {
				var ptr = a.id;
				var html = a.html;
				var verb = a.verb;
				var r = a.r;
				var entries = Object.entries(r);
				for (var i = 0; i < entries.length; i++) {
					var key = entries[i][0];
					if (entries[i][1] instanceof Array) {
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
					main: tmp.firstChild,
				};
				tmp.querySelectorAll("[data-deku-attr-internal]").forEach(function (e) {
					var key = e.getAttribute("data-deku-attr-internal");
					makeElement_(e)({ id: ptr + "." + key, attributes: r[key] })(state)();
				});
				tmp.querySelectorAll("[data-deku-elt-internal]").forEach(function (e) {
					var key = e.getAttribute("data-deku-elt-internal");
					var toCreate = {};
					toCreate[key] = r[key];
					// todo: rename element to root?
					$massiveCreate(ptr)({
						toCreate: toCreate,
					})(state)();
					e.appendChild(state.units[ptr + "." + key].main);
				});
			};
		};
	};
};
exports.makePursx_ = makePursx_;
exports.setSubgraph_ = setSubgraph_;
exports.sendSubgraphToTop_ = function (a) {
	return function (state) {
		return function () {
			// fill in
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
