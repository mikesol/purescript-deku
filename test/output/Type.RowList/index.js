// Generated by purs version 0.14.4
"use strict";
var Type_Data_RowList = require("../Type.Data.RowList/index.js");
var rowListSetImpl = function (dictTypeEquals) {
    return function (dictTypeEquals1) {
        return function (dictRowListRemove) {
            return {};
        };
    };
};
var rowListRemoveNil = {};
var rowListRemoveCons = function (dictRowListRemove) {
    return function (dictEquals) {
        return function (dictIf) {
            return {};
        };
    };
};
var rowListNubNil = {};
var rowListNubCons = function (dictTypeEquals) {
    return function (dictTypeEquals1) {
        return function (dictTypeEquals2) {
            return function (dictRowListRemove) {
                return function (dictRowListNub) {
                    return {};
                };
            };
        };
    };
};
var rowListAppendNil = function (dictTypeEquals) {
    return {};
};
var rowListAppendCons = function (dictRowListAppend) {
    return function (dictTypeEquals) {
        return {};
    };
};
var listToRowNil = {};
var listToRowCons = function (dictListToRow) {
    return function (dictCons) {
        return {};
    };
};
module.exports = {
    listToRowNil: listToRowNil,
    listToRowCons: listToRowCons,
    rowListRemoveNil: rowListRemoveNil,
    rowListRemoveCons: rowListRemoveCons,
    rowListSetImpl: rowListSetImpl,
    rowListNubNil: rowListNubNil,
    rowListNubCons: rowListNubCons,
    rowListAppendNil: rowListAppendNil,
    rowListAppendCons: rowListAppendCons,
    RLProxy: Type_Data_RowList.RLProxy
};
