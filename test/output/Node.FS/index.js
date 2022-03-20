// Generated by purs version 0.14.4
"use strict";
var Data_Show = require("../Data.Show/index.js");
var FileLink = (function () {
    function FileLink() {

    };
    FileLink.value = new FileLink();
    return FileLink;
})();
var DirLink = (function () {
    function DirLink() {

    };
    DirLink.value = new DirLink();
    return DirLink;
})();
var JunctionLink = (function () {
    function JunctionLink() {

    };
    JunctionLink.value = new JunctionLink();
    return JunctionLink;
})();
var R = (function () {
    function R() {

    };
    R.value = new R();
    return R;
})();
var R_PLUS = (function () {
    function R_PLUS() {

    };
    R_PLUS.value = new R_PLUS();
    return R_PLUS;
})();
var RS = (function () {
    function RS() {

    };
    RS.value = new RS();
    return RS;
})();
var RS_PLUS = (function () {
    function RS_PLUS() {

    };
    RS_PLUS.value = new RS_PLUS();
    return RS_PLUS;
})();
var W = (function () {
    function W() {

    };
    W.value = new W();
    return W;
})();
var WX = (function () {
    function WX() {

    };
    WX.value = new WX();
    return WX;
})();
var W_PLUS = (function () {
    function W_PLUS() {

    };
    W_PLUS.value = new W_PLUS();
    return W_PLUS;
})();
var WX_PLUS = (function () {
    function WX_PLUS() {

    };
    WX_PLUS.value = new WX_PLUS();
    return WX_PLUS;
})();
var A = (function () {
    function A() {

    };
    A.value = new A();
    return A;
})();
var AX = (function () {
    function AX() {

    };
    AX.value = new AX();
    return AX;
})();
var A_PLUS = (function () {
    function A_PLUS() {

    };
    A_PLUS.value = new A_PLUS();
    return A_PLUS;
})();
var AX_PLUS = (function () {
    function AX_PLUS() {

    };
    AX_PLUS.value = new AX_PLUS();
    return AX_PLUS;
})();
var symlinkTypeToNode = function (ty) {
    if (ty instanceof FileLink) {
        return "file";
    };
    if (ty instanceof DirLink) {
        return "dir";
    };
    if (ty instanceof JunctionLink) {
        return "junction";
    };
    throw new Error("Failed pattern match at Node.FS (line 68, column 24 - line 71, column 29): " + [ ty.constructor.name ]);
};
var showSymlinkType = {
    show: function (v) {
        if (v instanceof FileLink) {
            return "FileLink";
        };
        if (v instanceof DirLink) {
            return "DirLink";
        };
        if (v instanceof JunctionLink) {
            return "JunctionLink";
        };
        throw new Error("Failed pattern match at Node.FS (line 73, column 1 - line 76, column 37): " + [ v.constructor.name ]);
    }
};
var showFileFlags = {
    show: function (v) {
        if (v instanceof R) {
            return "R";
        };
        if (v instanceof R_PLUS) {
            return "R_PLUS";
        };
        if (v instanceof RS) {
            return "RS";
        };
        if (v instanceof RS_PLUS) {
            return "RS_PLUS";
        };
        if (v instanceof W) {
            return "W";
        };
        if (v instanceof WX) {
            return "WX";
        };
        if (v instanceof W_PLUS) {
            return "W_PLUS";
        };
        if (v instanceof WX_PLUS) {
            return "WX_PLUS";
        };
        if (v instanceof A) {
            return "A";
        };
        if (v instanceof AX) {
            return "AX";
        };
        if (v instanceof A_PLUS) {
            return "A_PLUS";
        };
        if (v instanceof AX_PLUS) {
            return "AX_PLUS";
        };
        throw new Error("Failed pattern match at Node.FS (line 22, column 1 - line 34, column 27): " + [ v.constructor.name ]);
    }
};
var fileFlagsToNode = function (ff) {
    if (ff instanceof R) {
        return "r";
    };
    if (ff instanceof R_PLUS) {
        return "r+";
    };
    if (ff instanceof RS) {
        return "rs";
    };
    if (ff instanceof RS_PLUS) {
        return "rs+";
    };
    if (ff instanceof W) {
        return "w";
    };
    if (ff instanceof WX) {
        return "wx";
    };
    if (ff instanceof W_PLUS) {
        return "w+";
    };
    if (ff instanceof WX_PLUS) {
        return "wx+";
    };
    if (ff instanceof A) {
        return "a";
    };
    if (ff instanceof AX) {
        return "ax";
    };
    if (ff instanceof A_PLUS) {
        return "a+";
    };
    if (ff instanceof AX_PLUS) {
        return "ax+";
    };
    throw new Error("Failed pattern match at Node.FS (line 42, column 22 - line 54, column 19): " + [ ff.constructor.name ]);
};
var eqSymlinkType = {
    eq: function (v) {
        return function (v1) {
            if (v instanceof FileLink && v1 instanceof FileLink) {
                return true;
            };
            if (v instanceof DirLink && v1 instanceof DirLink) {
                return true;
            };
            if (v instanceof JunctionLink && v1 instanceof JunctionLink) {
                return true;
            };
            return false;
        };
    }
};
var eqFileFlags = {
    eq: function (x) {
        return function (y) {
            return Data_Show.show(showFileFlags)(x) === Data_Show.show(showFileFlags)(y);
        };
    }
};
module.exports = {
    R: R,
    R_PLUS: R_PLUS,
    RS: RS,
    RS_PLUS: RS_PLUS,
    W: W,
    WX: WX,
    W_PLUS: W_PLUS,
    WX_PLUS: WX_PLUS,
    A: A,
    AX: AX,
    A_PLUS: A_PLUS,
    AX_PLUS: AX_PLUS,
    FileLink: FileLink,
    DirLink: DirLink,
    JunctionLink: JunctionLink,
    symlinkTypeToNode: symlinkTypeToNode,
    fileFlagsToNode: fileFlagsToNode,
    showFileFlags: showFileFlags,
    eqFileFlags: eqFileFlags,
    showSymlinkType: showSymlinkType,
    eqSymlinkType: eqSymlinkType
};
