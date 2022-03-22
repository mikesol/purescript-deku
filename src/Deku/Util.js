exports.unsafeLeftBiasedSet = function (label) {
	return function (value) {
		return function (rec) {
			var copy = {};
			copy[label] = value;
			for (var key in rec) {
				if ({}.hasOwnProperty.call(rec, key)) {
					copy[key] = rec[key];
				}
			}
			return copy;
		};
	};
};
