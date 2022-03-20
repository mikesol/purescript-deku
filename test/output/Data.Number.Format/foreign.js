function wrap(method) {
  return function(d) {
    return function(num) {
      return method.apply(num, [d]);
    };
  };
}

exports.toPrecisionNative   = wrap(Number.prototype.toPrecision);
exports.toFixedNative       = wrap(Number.prototype.toFixed);
exports.toExponentialNative = wrap(Number.prototype.toExponential);

exports.toString = function(num) { return num.toString(); };
