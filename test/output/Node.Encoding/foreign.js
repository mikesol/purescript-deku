/* global Buffer */
"use strict";

exports.byteLengthImpl = function (str) {
  return function (enc) {
    return Buffer.byteLength(str, enc);
  };
};
