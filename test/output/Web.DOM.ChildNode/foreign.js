"use strict";

exports.remove = function (node) {
  return function () {
    return node.remove();
  };
};
