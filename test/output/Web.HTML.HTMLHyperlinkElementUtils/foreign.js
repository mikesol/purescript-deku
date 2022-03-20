"use strict";

exports.href = function (u) {
  return function () {
    return u.href;
  };
};

exports.setHref = function (href) {
  return function (u) {
    return function () {
      u.href = href;
    };
  };
};

// ----------------------------------------------------------------------------

exports.origin = function (u) {
  return function () {
    return u.origin;
  };
};

// ----------------------------------------------------------------------------

exports.protocol = function (u) {
  return function () {
    return u.protocol;
  };
};

exports.setProtocol = function (protocol) {
  return function (u) {
    return function () {
      u.protocol = protocol;
    };
  };
};

// ----------------------------------------------------------------------------

exports.username = function (u) {
  return function () {
    return u.username;
  };
};

exports.setUsername = function (username) {
  return function (u) {
    return function () {
      u.username = username;
    };
  };
};

// ----------------------------------------------------------------------------

exports.password = function (u) {
  return function () {
    return u.password;
  };
};

exports.setPassword = function (password) {
  return function (u) {
    return function () {
      u.password = password;
    };
  };
};

// ----------------------------------------------------------------------------

exports.host = function (u) {
  return function () {
    return u.host;
  };
};

exports.setHost = function (host) {
  return function (u) {
    return function () {
      u.host = host;
    };
  };
};

// ----------------------------------------------------------------------------

exports.hostname = function (u) {
  return function () {
    return u.hostname;
  };
};

exports.setHostname = function (hostname) {
  return function (u) {
    return function () {
      u.hostname = hostname;
    };
  };
};

// ----------------------------------------------------------------------------

exports.port = function (u) {
  return function () {
    return u.port;
  };
};

exports.setPort = function (port) {
  return function (u) {
    return function () {
      u.port = port;
    };
  };
};

// ----------------------------------------------------------------------------

exports.pathname = function (u) {
  return function () {
    return u.pathname;
  };
};

exports.setPathname = function (pathname) {
  return function (u) {
    return function () {
      u.pathname = pathname;
    };
  };
};

// ----------------------------------------------------------------------------

exports.search = function (u) {
  return function () {
    return u.search;
  };
};

exports.setSearch = function (search) {
  return function (u) {
    return function () {
      u.search = search;
    };
  };
};

// ----------------------------------------------------------------------------

exports.hash = function (u) {
  return function () {
    return u.hash;
  };
};

exports.setHash = function (hash) {
  return function (u) {
    return function () {
      u.hash = hash;
    };
  };
};
