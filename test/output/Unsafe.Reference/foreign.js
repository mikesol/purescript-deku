"use strict";

exports.reallyUnsafeRefEq = function (a) {
  return function (b) {
    return a === b;
  };
};
