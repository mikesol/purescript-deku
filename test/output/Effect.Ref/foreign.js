"use strict";

exports.new = function (val) {
  return function () {
    return { value: val };
  };
};

exports.newWithSelf = function (f) {
  return function () {
    var ref = { value: null };
    ref.value = f(ref);
    return ref;
  };
};

exports.read = function (ref) {
  return function () {
    return ref.value;
  };
};

exports.modifyImpl = function (f) {
  return function (ref) {
    return function () {
      var t = f(ref.value);
      ref.value = t.state;
      return t.value;
    };
  };
};

exports.write = function (val) {
  return function (ref) {
    return function () {
      ref.value = val;
    };
  };
};
