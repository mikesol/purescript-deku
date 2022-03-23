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
		var sl = unit.children[sorting[i][0]].terminalPtrs.length;
		for (var k = 0; k < sl; k++) {
			unit.main.insertBefore(
				unit.children[sorting[i][0]].units[
					unit.children[sorting[i][0]].terminalPtrs[sl - k - 1]
				].main,
				unit.main.firstChild
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
							outgoing: [],
							incoming: [],
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
				}
				for (var i = 0; i < needsConnecting.length; i++) {
					var j = needsConnecting[i];
					for (var k = 0; k < children[j].terminalPtrs.length; k++) {
						connectXToY(false)(children[j].terminalPtrs[k])(ptr)(children[j])(
							state
						)();
					}
				}
			};
		};
	};
};
exports.setSubgraph_ = setSubgraph_;
exports.massiveCreate_ = function ($unSubgraph) {
	return function ($makeSubgraph) {
		return function ($makeRoot) {
			return function ($makeElement) {
				return function ($makeText) {
					return function (a) {
						return function (state) {
							return function () {
								state.terminalPtrs = [];
								massiveCreateCreateStep_(true)("")($unSubgraph)($makeSubgraph)
								($makeRoot)($makeElement)($makeText)(a)(state)();
								massiveCreateConnectStep_("")(a)(state)();
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
					var children = Object.entries(entries[i][1].myNameIs !== undefined ? entries[i][1].unMyNameIs.children : entries[i][1].children);
					for (var j = 0; j < children.length; j++) {
						var toId =
							entries[i][1].myNameIs !== undefined
								? entries[i][1].myNameIs
								: $prefix + ($prefix === "" ? "" : ".") + entries[i][0];
						var fromId = children[j][1].myNameIs !== undefined ? children[j][1].myNameIs : toId +
							"." +
							children[j][0];

						connectXToY_({
							fromId: fromId,
							toId: toId,
						})(state)();
						var child = children[j][1].myNameIs !== undefined ? children[j][1].unMyNameIs : children[j][1];
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
													massiveCreateCreateStep_($isTerminal)("")($unSubgraph)(
														$makeSubgraph
													)($makeRoot)($makeElement)($makeText)({
														toCreate: toCreate,
													})(state)();
													continue;
												}
												var key =
													$prefix + ($prefix === "" ? "" : ".") + entries[i][0];
												if ($isTerminal) {
													state.terminalPtrs.push(key);
												}
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
												massiveCreateCreateStep_(false)(key)($unSubgraph)(
													$makeSubgraph
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
								massiveChange_($changeSubgraph)($setAttribute)($setText)({ toChange: value.children })(state)();
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
				outgoing: [],
				incoming: [],
				main: a.root,
			};
		};
	};
};
