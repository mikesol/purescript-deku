exports.getDeviceType = function (tablet) {
	return function (mobile) {
		return function (desktop) {
			return function () {
				const ua = navigator.userAgent;
				if (/(tablet|ipad|playbook|silk)|(android(?!.*mobi))/i.test(ua)) {
					return tablet;
				} else if (
					/Mobile|Android|iP(hone|od)|IEMobile|BlackBerry|Kindle|Silk-Accelerated|(hpw|web)OS|Opera M(obi|ini)/.test(
						ua
					)
				) {
					return mobile;
				}
				return desktop;
			};
		};
	};
};
