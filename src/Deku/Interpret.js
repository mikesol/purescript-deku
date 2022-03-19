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
						// if (
						// 	calledExternally &&
						// 	(stateY.units[y].isSubgraph || stateY.units[y].isTumult)
						// ) {
						// 	return;
						// }
						stateY.units[y].main.appendChild(stateX.units[x].main);
						stateX.units[x].outgoing.push({ unit: y, state: stateY });
						stateY.units[y].incoming.push({ unit: x, state: stateX });
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
						// if (
						// 	calledExternally &&
						// 	(stateY.units[y].isSubgraph || stateY.units[y].isTumult)
						// ) {
						// 	return;
						// }
						stateY.units[y].main.removeChild(stateX.units[x].main);
						stateX.units[x].outgoing = stateX.units[x].outgoing.filter(
							function (i) {
								return !(i.unit === y && i.state.unqidfr === stateY.unqidfr);
							}
						);
						stateY.units[y].incoming = stateY.units[y].incoming.filter(
							function (i) {
								return !(i.unit === x && i.state.unqidfr === stateX.unqidfr);
							}
						);
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
exports.makeElement_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				outgoing: [],
				incoming: [],
				listeners: {},
				main: document.createElement(a.tag),
			};
			for (var i = 0; i < a.attributes.length; i++) {
				if (a.attributes[i].value.type === "cb") {
					var atty = a.attributes[i];
					var el = (e) => atty.value.value(e)();
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
exports.makeText_ = function (a) {
	return function (state) {
		return function () {
			var ptr = a.id;
			state.units[ptr] = {
				outgoing: [],
				incoming: [],
				main: document.createElement("span"),
			};
			state.units[ptr].main.setAttribute("style", "white-space: pre;");
			state.units[ptr].main.innerHTML = a.text
				.replace(/\n/g, "<br>")
				.replace(/ /g, "&nbsp;");
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
				state.units[ptr].main.setAttribute(a.key, avv);
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
		unit.main.insertBefore(
			unit.children[sorting[i][0]].units[unit.terminalPtr].main,
			unit.main.firstChild
		);
	}
};
exports.makeSubgraph_ = function (ptr) {
	return function (terminalPtr) {
		return function (envs) {
			return function (sceneM) {
				return function (funk) {
					return function (state) {
						return function () {
							var children = [];
							var scenes = [];
							for (var i = 0; i < envs.length; i++) {
								children[i] = {
									units: {},
									unqidfr: makeid(10),
									parent: state,
								};
								scenes[i] = sceneM(i);
							}
							state.units[ptr] = {
								outgoing: [],
								incoming: [],
								main: document.createElement("div"),
								children: children,
								funk: funk,
								terminalPtr: terminalPtr,
								isSubgraph: true,
								scenes: scenes,
							};
							state.units[ptr].main.setAttribute("style", "display:contents;");
							var sortable = [];
							for (var i = 0; i < scenes.length; i++) {
								var applied = funk[i](envs[i])(scenes[i]);
								for (var j = 0; j < applied.instructions.length; j++) {
									// thunk
									applied.instructions[j](children[i])();
								}
								scenes[i] = applied.nextScene;
								sortable.push([i, applied.forOrdering]);
							}
							// last DOM elements first
							sortable.sort((a, b) => b[1] - a[1]);
							doSortingOnSubgraphs(state.units[ptr], sortable);
							for (var i = 0; i < children.length; i++) {
								connectXToY(false)(terminalPtr)(ptr)(children[i])(state)();
							}
						};
					};
				};
			};
		};
	};
};
exports.makeTumult_ = function (ptr) {
	return function (terminalPtr) {
		return function (scenes) {
			return function (nothing) {
				return function () {
					return function (arrMaker) {
						return function (state) {
							return function () {
								var children = [];
								for (var i = 0; i < scenes.length; i++) {
									children[i] = {
										units: {},
										parent: state,
										unqidfr: makeid(10),
									};
								}
								state.units[ptr] = {
									outgoing: [],
									incoming: [],
									main: document.createElement("div"),
									children: children,
									isTumult: true,
									scenes: scenes,
								};
								state.units[ptr].main.setAttribute(
									"style",
									"display:contents;"
								);
								for (var i = 0; i < scenes.length; i++) {
									var curScene = arrMaker(scenes[i])(nothing);
									for (var j = 0; j < curScene.length; j++) {
										// thunk
										curScene[j](children[i])();
									}
								}
								var heads = [];
								for (var i = 0; i < children.length; i++) {
									heads[i] = children[i].units[terminalPtr];
								}
								state.units[ptr].heads = heads;
								for (var i = 0; i < children.length; i++) {
									connectXToY(false)(terminalPtr)(ptr)(children[i])(state)();
								}
							};
						};
					};
				};
			};
		};
	};
};
exports.setTumult_ = function (ptr) {
	return function (terminalPtr) {
		return function (scenes) {
			return function (nothing) {
				return function (just) {
					return function (arrMaker) {
						return function (state) {
							return function () {
								var needsCreation = !(
									state.units[ptr] &&
									state.units[ptr].children &&
									state.units[ptr].scenes
								);
								if (needsCreation) {
									var children = [];
									for (var i = 0; i < scenes.length; i++) {
										children[i] = {
											units: {},
											parent: state,
											unqidfr: makeid(10),
										};
									}
									state.units[ptr].incoming = [];
									state.units[ptr].outgoing = [];
									state.units[ptr].children = children;
									state.units[ptr].isTumult = true;
								}
								var oldScenes = state.units[ptr].scenes;
								var children = state.units[ptr].children;
								for (var i = 0; i < scenes.length; i++) {
									var oldScene =
										oldScenes && oldScenes[i] ? just(oldScenes[i]) : nothing;
									var curScene = arrMaker(scenes[i])(oldScene);
									for (var j = 0; j < curScene.length; j++) {
										// thunk
										curScene[j](children[i])();
									}
								}
								state.units[ptr].scenes = scenes;
								// todo - add this logic to subgraph
								var heads = [];
								for (var i = 0; i < children.length; i++) {
									heads[i] = children[i].units[terminalPtr];
									if (state.units[ptr].heads[i] !== heads[i]) {
										var tmp = { units: {} };
										tmp.units[terminalPtr] = state.units[ptr].heads[i];
										disconnectXFromY(false)(terminalPtr)(ptr)(tmp)(state)();
										connectXToY(false)(terminalPtr)(ptr)(children[i])(state)();
									}
								}
								state.units[ptr].heads = heads;
								if (needsCreation) {
									for (var i = 0; i < children.length; i++) {
										connectXToY(false)(terminalPtr)(ptr)(children[i])(state)();
									}
								}
							};
						};
					};
				};
			};
		};
	};
};
exports.setSubgraph_ = function (ptr) {
	return function (envs) {
		return function (state) {
			return function () {
				var scenes = state.units[ptr].scenes;
				var children = state.units[ptr].children;
				var sortable = [];
				for (var i = 0; i < scenes.length; i++) {
					var applied = state.units[ptr].funk[i](envs[i])(scenes[i]);
					for (var j = 0; j < applied.instructions.length; j++) {
						// thunk
						applied.instructions[j](children[i])();
					}
					sortable.push([i, applied.forOrdering]);
					scenes[i] = applied.nextScene;
				}
				sortable.sort((a, b) => b[1] - a[1]);
				doSortingOnSubgraphs(state.units[ptr], sortable);
			};
		};
	};
};
exports.setSingleSubgraph_ = function (ptr) {
	return function (i) {
		return function (env) {
			return function (state) {
				return function () {
					var scenes = state.units[ptr].scenes;
					var children = state.units[ptr].children;
					var applied = state.units[ptr].funk[i](env)(scenes[i]);
					for (var j = 0; j < applied.instructions.length; j++) {
						// thunk
						applied.instructions[j](children[i])();
					}
					scenes[i] = applied.nextScene;
				};
			};
		};
	};
};
exports.massiveCreate_ = function ($unSubgraph) {
	return function ($makeSubgraph) {
		return function ($makeTumult) {
			return function ($makeRoot) {
				return function ($makeElement) {
					return function ($makeText) {
						return function (a) {
							return function (state) {
								return function () {
									massiveCreateCreateStep_("")($unSubgraph)($makeSubgraph)(
										$makeTumult
									)($makeRoot)($makeElement)($makeText)(a)(state)();
									massiveCreateConnectStep_("")(a)(state)();
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
					var children = Object.entries(entries[i][1].children);
					for (var j = 0; j < children.length; j++) {
						var fromId =
							$prefix +
							($prefix === "" ? "" : ".") +
							entries[i][0] +
							"." +
							children[j][0];
						var toId = $prefix + ($prefix === "" ? "" : ".") + entries[i][0];
						if (
							state.units[fromId].isSubgraph ||
							state.units[fromId].isTumult
						) {
							// the connection has already occurred
							//continue;
						}
						connectXToY_({
							fromId: fromId,
							toId: toId,
						})(state)();
						if (children[j][1].children !== {}) {
							var toCreate = {};
							toCreate[children[j][0]] = children[j][1];
							massiveCreateConnectStep_(
								$prefix + ($prefix === "" ? "" : ".") + entries[i][0]
							)({
								toCreate: toCreate,
							})(state)();
						}
					}
				}
			};
		};
	};
};
var massiveCreateCreateStep_ = function ($prefix) {
	return function ($unSubgraph) {
		return function ($makeSubgraph) {
			return function ($makeTumult) {
				return function ($makeRoot) {
					return function ($makeElement) {
						return function ($makeText) {
							return function (a) {
								return function (state) {
									return function () {
										var entries = Object.entries(a.toCreate);
										for (var i = 0; i < entries.length; i++) {
											var key =
												$prefix + ($prefix === "" ? "" : ".") + entries[i][0];
											var value = entries[i][1];
											if (value.element.element !== undefined) {
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
											} else if (value.element.envs !== undefined) {
												// it's a subgraph
												$makeSubgraph({
													id: key,
													envs: value.element.envs,
													terminus: value.element.terminus,
													scenes: $unSubgraph(value.element.subgraphMaker),
												})(state)();
											} else if (value.element.tumult !== undefined) {
												$makeTumult({
													id: key,
													instructions: value.element.tumult,
													terminus: value.element.terminus,
												})(state)();
											} else {
												throw new Error(
													"Don't know how to handle " + key + " " + value
												);
											}
											massiveCreateCreateStep_(key)($unSubgraph)($makeSubgraph)(
												$makeTumult
											)($makeRoot)($makeElement)($makeText)({
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
exports.massiveChange_ = function ($setSubgraph) {
	return function ($setAttribute) {
		return function ($setText) {
			return function ($setTumult) {
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
								} else if (value.element.tumult !== undefined) {
									$setTumult({
										id: key,
										instructions: value.element.tumult,
									})(state)();
								} else {
									throw new Error(
										"Don't know how to handle " + key + " " + value
									);
								}
								massiveChange_($changeSubgraph)($setAttribute)($setText)(
									$setTumult
								)({ toChange: value.children })(state)();
							}
						};
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
				outgoing: [],
				incoming: [],
				main: a.root,
			};
		};
	};
};
