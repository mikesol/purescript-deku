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
								outgoing: [],
								incoming: [],
								sceneM: sceneM,
								main: document.createElement("div"),
								funkyFx: funkyFx,
								terminalPtr: terminalPtr,
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
};
exports.makeTumult_ = function (ptr) {
	return function (terminalPtr) {
		return function (scenes) {
			return function (nothing) {
				return function (just) {
					return function (arrMaker) {
						return function (state) {
							return function () {
								state.units[ptr] = {
									outgoing: [],
									incoming: [],
									main: document.createElement("div"),
									isTumult: true,
									terminalPtr: terminalPtr,
									children: {},
									scenes: {},
								};
								state.units[ptr].main.setAttribute(
									"style",
									"display:contents;"
								);
								setTumult_(ptr)(terminalPtr)(scenes)(nothing)(just)(arrMaker)(
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
var setTumult_ = function (ptr) {
	return function (terminalPtr) {
		return function (newScenes) {
			return function (nothing) {
				return function (just) {
					return function (arrMaker) {
						return function (state) {
							return function () {
								var scenes = state.units[ptr].scenes;
								var children = state.units[ptr].children;
								var needsConnecting = [];
								var newScenesAsObj = {};
								var preserved = [];
								for (var i = 0; i < newScenes.length; i++) {
									var j = newScenes[i].pos;
									if (newScenes[i].instructions !== null) {
										newScenesAsObj[j] = newScenes[i].instructions;
									}
									if (
										newScenes[i].instructions === null &&
										scenes[j] === undefined
									) {
									} else if (
										newScenes[i].instructions !== null &&
										scenes[j] !== undefined
									) {
										preserved.push(j);
									} else if (
										newScenes[i].instructions !== null &&
										scenes[j] === undefined
									) {
										children[j] = {
											units: {},
											unqidfr: makeid(10),
											parent: state,
										};
										scenes[j] = newScenes[i].instructions;
										needsConnecting.push(j);
									} else {
										disconnectXFromY(false)(state.units[ptr].terminalPtr)(ptr)(
											children[j]
										)(state)();
										// delete unused
										delete scenes[j];
										delete children[j];
									}
								}
								for (var i = 0; i < newScenes.length; i++) {
									if (newScenes[i].instructions === null) {
										continue;
									}
									var oldScene =
										// if it does not need connecting
										needsConnecting.indexOf(newScenes[i].pos) === -1
											? // then we use the scene as the old scene
											  just(scenes[newScenes[i].pos])
											: // otherwise we use nothing
											  nothing;
									var curScene = arrMaker(newScenes[i].instructions)(oldScene);
									for (var j = 0; j < curScene.length; j++) {
										// thunk
										curScene[j](children[newScenes[i].pos])();
									}
								}
								state.units[ptr].scenes = newScenesAsObj;
								// todo - add this logic to subgraph
								var heads = {};
								for (var m = 0; m < preserved.length; m++) {
									var i = preserved[m];
									heads[i] = children[i].units[terminalPtr];
									if (state.units[ptr].heads[i] !== heads[i]) {
										var tmp = { units: {} };
										tmp.units[terminalPtr] = state.units[ptr].heads[i];
										disconnectXFromY(false)(terminalPtr)(ptr)(tmp)(state)();
										connectXToY(false)(terminalPtr)(ptr)(children[i])(state)();
									}
								}
								for (var i = 0; i < needsConnecting.length; i++) {
									var j = needsConnecting[i];
									connectXToY(false)(terminalPtr)(ptr)(children[j])(state)();
									heads[j] = children[j].units[terminalPtr];
								}
								state.units[ptr].heads = heads;
							};
						};
					};
				};
			};
		};
	};
};
exports.setTumult_ = setTumult_;
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
						disconnectXFromY(false)(state.units[ptr].terminalPtr)(ptr)(
							children[j]
						)(state)();
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
				}
				for (var i = 0; i < needsConnecting.length; i++) {
					var j = needsConnecting[i];
					connectXToY(false)(state.units[ptr].terminalPtr)(ptr)(children[j])(
						state
					)();
				}
			};
		};
	};
};
exports.setSubgraph_ = setSubgraph_;
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
											} else if (value.element.subgraphMaker !== undefined) {
												// it's a subgraph
												$makeSubgraph({
													id: key,
													terminus: value.element.terminus,
													scenes: $unSubgraph(value.element.subgraphMaker),
													envs: value.element.envs
												})(state)();
											} else if (value.element.tumult !== undefined) {
												$makeTumult({
													id: key,
													instructions: value.element.tumult,
													terminus: value.element.terminus,
												})(state)();
											} else {
												throw new Error(
													"Don't know how to handle " +
														key +
														" " +
														Object.keys(value.element)
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
