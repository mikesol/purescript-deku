exports.massiveCreate_ = function ($unSubgraph) {
	return function ($makeSubgraph) {
		return function ($makeTumult) {
			return function ($makeRoot) {
				return function ($makeElement) {
					return function ($makeText) {
						return function ($connectXToY) {
							return function (a) {
								return function () {
									var o = [];
									o.push.apply(
										o,
										massiveCreateCreateStep_("")($unSubgraph)($makeSubgraph)(
											$makeTumult
										)($makeRoot)($makeElement)($makeText)(a)()
									);
									o.push.apply(
										o,
										massiveCreateConnectStep_("")($connectXToY)(a)()
									);
									return o;
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
	return function ($connectXToY) {
		return function (a) {
			return function () {
				var o = [];
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

						o.push(
							$connectXToY({
								fromId: fromId,
								toId: toId,
							})()
						);
						if (children[j][1].children !== {}) {
							var toCreate = {};
							toCreate[children[j][0]] = children[j][1];
							o.push.apply(
								o,
								massiveCreateConnectStep_(
									$prefix + ($prefix === "" ? "" : ".") + entries[i][0]
								)($connectXToY)({
									toCreate: toCreate,
								})()
							);
						}
					}
				}
				return o;
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
								return function () {
									var o = [];
									var entries = Object.entries(a.toCreate);
									for (var i = 0; i < entries.length; i++) {
										var key =
											$prefix + ($prefix === "" ? "" : ".") + entries[i][0];
										var value = entries[i][1];
										if (value.element.element !== undefined) {
											// it's a root
											o.push(
												$makeRoot({ id: key, root: value.element.element })()
											);
										} else if (value.element.tag !== undefined) {
											// it's an element
											o.push(
												$makeElement({
													id: key,
													tag: value.element.tag,
													attributes: value.element.attributes,
												})()
											);
										} else if (value.element.text !== undefined) {
											// it's an element
											o.push(
												$makeText({
													id: key,
													text: value.element.text,
												})()
											);
										} else if (value.element.subgraphMaker !== undefined) {
											// it's a subgraph
											o.push(
												$makeSubgraph({
													id: key,
													terminus: value.element.terminus,
													scenes: $unSubgraph(value.element.subgraphMaker),
												})()
											);
										} else if (value.element.tumult !== undefined) {
											o.push(
												$makeTumult({
													id: key,
													instructions: value.element.tumult,
													terminus: value.element.terminus,
												})()
											);
										} else {
											throw new Error(
												"Don't know how to handle " +
													key +
													" " +
													Object.keys(value.element)
											);
										}
										o.push.apply(
											o,
											massiveCreateCreateStep_(key)($unSubgraph)($makeSubgraph)(
												$makeTumult
											)($makeRoot)($makeElement)($makeText)({
												toCreate: value.children,
											})()
										);
									}
									return o;
								};
							};
						};
					};
				};
			};
		};
	};
};
