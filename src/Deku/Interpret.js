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

var connectXToY = function (calledExternally) {
	return function (x) {
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
};
var connectXToY_ = function (x) {
	return function (state) {
		return connectXToY(true)(x.fromId)(x.toId)(state)(state);
	};
};
exports.connectXToY_ = connectXToY_;
var disconnectXFromY = function (calledExternally) {
	return function (x) {
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
};
exports.disconnectXFromY_ = function (x) {
	return function (state) {
		return disconnectXFromY(true)(x.fromId)(x.toId)(state)(state);
	};
};
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
				for (var i = 0; i < a.attributes.length; i++) {
					if (a.attributes[i].value.type === "cb") {
						var atty = a.attributes[i];
						var el = ((x) => (e) => x.value.value(e)())(atty);
						state.units[ptr].main.addEventListener(atty.key, el);
						state.units[ptr].listeners[a.attributes[i].key] = el;
					} else {
						state.units[ptr].main.setAttribute(
							a.attributes[i].key,
							a.attributes[i].value.value
						);
					}
				}
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
			state.units[ptr].main.innerText = a.text;
			//.replace(/\n/g, "<br>")
			//.replace(/ /g, "&nbsp;");
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
exports.makeSubgraph_ = function (ptr) {
	return function (sceneM) {
		return function (envs) {
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
						setSubgraph_(ptr)(envs)(state)();
					};
				};
			};
		};
	};
};

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
							disconnectXFromY(false)(children[j].terminalPtrs[k])(ptr)(
								children[j]
							)(state)();
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
							connectXToY(false)(children[j].terminalPtrs[k])(ptr)(children[j])(
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
exports.massiveCreate_ = function ($unSubgraph) {
	return function ($makeSubgraph) {
		return function ($makeRoot) {
			return function ($makeElement) {
				return function ($makeText) {
					return function ($makePursx) {
						return function (prefix) {
							return function (a) {
								return function (state) {
									return function () {
										// if we have pursx, it may call massiveCreate internally again, in which case we don't want to reset this
										if (!state.terminalPtrs) {
											state.terminalPtrs = [];
										}
										massiveCreateCreateStep_(prefix === null)(
											prefix === null ? "" : prefix
										)($unSubgraph)($makeSubgraph)($makeRoot)($makeElement)(
											$makeText
										)($makePursx)(a)(state)();
										massiveCreateConnectStep_(prefix === null ? "" : prefix)(a)(
											state
										)();
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var massiveCreateConnectStep_ = function ($prefix) {
	return function (a) {
		return function (state) {
			return function () {
				var entries = Object.entries(a.toCreate);
				for (var i = 0; i < entries.length; i++) {
					if (entries[i][1].html) {
						continue;
					}
					var children = Object.entries(
						entries[i][1].myNameIs !== undefined
							? entries[i][1].unMyNameIs.children
							: entries[i][1].children
					);
					for (var j = 0; j < children.length; j++) {
						var toId =
							entries[i][1].myNameIs !== undefined
								? entries[i][1].myNameIs
								: $prefix + ($prefix === "" ? "" : ".") + entries[i][0];
						var fromId =
							children[j][1].myNameIs !== undefined
								? children[j][1].myNameIs
								: toId + "." + children[j][0];

						connectXToY_({
							fromId: fromId,
							toId: toId,
						})(state)();
						if (children[j][1].html !== undefined) {
							continue;
						}
						var child =
							children[j][1].myNameIs !== undefined
								? children[j][1].unMyNameIs
								: children[j][1];
						if (child.html) {
							continue;
						}
						if (child.children !== {}) {
							var toCreate = {};
							toCreate[children[j][0]] = children[j][1];
							massiveCreateConnectStep_(toId)({
								toCreate: toCreate,
							})(state)();
						}
					}
				}
			};
		};
	};
};
var massiveCreateCreateStep_ = function ($isTerminal) {
	return function ($prefix) {
		return function ($unSubgraph) {
			return function ($makeSubgraph) {
				return function ($makeRoot) {
					return function ($makeElement) {
						return function ($makeText) {
							return function ($makePursx) {
								return function (a) {
									return function (state) {
										return function () {
											var entries = Object.entries(a.toCreate);
											for (var i = 0; i < entries.length; i++) {
												var value = entries[i][1];
												if (value.myNameIs !== undefined) {
													// my name is
													var toCreate = {};
													toCreate[value.myNameIs] = value.unMyNameIs;
													massiveCreateCreateStep_($isTerminal)("")(
														$unSubgraph
													)($makeSubgraph)($makeRoot)($makeElement)($makeText)(
														$makePursx
													)({
														toCreate: toCreate,
													})(state)();
													continue;
												}
												var key =
													$prefix + ($prefix === "" ? "" : ".") + entries[i][0];
												if ($isTerminal) {
													state.terminalPtrs.push(key);
												}
												if (value.html !== undefined) {
													$makePursx({
														id: key,
														html: value.html,
														verb: value.verb,
														r: value.r,
													})(state)();
												} else if (value.element.element !== undefined) {
													// it's a root
													$makeRoot({ id: key, root: value.element.element })(
														state
													)();
												} else if (value.element.tag !== undefined) {
													// it's an element
													$makeElement({
														id: key,
														tag: value.element.tag,
														attributes: value.element.attributes,
													})(state)();
												} else if (value.element.text !== undefined) {
													// it's an element
													$makeText({
														id: key,
														text: value.element.text,
													})(state)();
												} else if (value.element.subgraphMaker !== undefined) {
													// it's a subgraph
													$makeSubgraph({
														id: key,
														scenes: $unSubgraph(value.element.subgraphMaker),
														envs: value.element.envs,
													})(state)();
												} else {
													throw new Error(
														"Don't know how to handle " +
															key +
															" " +
															Object.keys(value.element)
													);
												}
												// do not keep creating if it is html
												if (value.html !== undefined) {
													continue;
												}
												massiveCreateCreateStep_(false)(key)($unSubgraph)(
													$makeSubgraph
												)($makeRoot)($makeElement)($makeText)($makePursx)({
													toCreate: value.children,
												})(state)();
											}
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
exports.massiveChange_ = function ($setSubgraph) {
	return function ($setAttribute) {
		return function ($setText) {
			return function (a) {
				return function (state) {
					return function () {
						var entries = Object.entries(a.toCreate);
						for (var i = 0; i < entries.length; i++) {
							var key = entries[i][0];
							var value = entries[i][1];
							if (value.element.element !== undefined) {
								// it's a root, do nothing
							} else if (value.element.tag !== undefined) {
								// it's an element
								for (var j = 0; j < value.element.attributes.length; j++) {
									$setAttribute({
										id: key,
										key: value.element.attributes[j].key,
										value: value.element.attributes[j].value,
									})(state)();
								}
							} else if (value.element.text !== undefined) {
								// it's an element
								$setText({
									id: key,
									text: value.element.text,
								})(state)();
							} else if (value.element.envs !== undefined) {
								// it's a subgraph
								$setSubgraph({
									id: key,
									envs: value.element.envs,
								})(state)();
							} else {
								throw new Error(
									"Don't know how to handle " + key + " " + value
								);
							}
							massiveChange_($changeSubgraph)($setAttribute)($setText)({
								toChange: value.children,
							})(state)();
						}
					};
				};
			};
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
