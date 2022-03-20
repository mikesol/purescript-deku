"use strict";

exports.copyRecord = function(rec) {
  var copy = {};
  for (var key in rec) {
    if ({}.hasOwnProperty.call(rec, key)) {
      copy[key] = rec[key];
    }
  }
  return copy;
};

exports.unsafeInsert = function(l) {
  return function(a) {
    return function(rec) {
      rec[l] = a;
      return rec;
    };
  };
};

exports.unsafeModify = function(l) {
  return function (f) {
    return function(rec) {
      rec[l] = f(rec[l]);
      return rec;
    };
  };
};

exports.unsafeDelete = function(l) {
  return function(rec) {
    delete rec[l];
    return rec;
  };
};

exports.unsafeRename = function(l1) {
  return function (l2) {
    return function (rec) {
      rec[l2] = rec[l1];
      delete rec[l1];
      return rec;
    };
  };
};
