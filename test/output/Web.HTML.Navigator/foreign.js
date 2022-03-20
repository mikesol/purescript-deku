"use strict";

exports.language = function (navigator) {
  return function () {
    return navigator.language;
  };
};

exports.platform = function (navigator) {
  return function () {
    return navigator.platform;
  };
};

exports.userAgent = function (navigator) {
  return function () {
    return navigator.userAgent;
  };
};