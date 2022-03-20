"use strict";

exports.hash = function (location) {
  return function () {
    return location.hash;
  };
};

exports.setHash = function (hash) {
  return function (location) {
    return function () {
      location.hash = hash;
    };
  };
};

// ----------------------------------------------------------------------------

exports.host = function (location) {
  return function () {
    return location.host;
  };
};

exports.setHost = function (host) {
  return function (location) {
    return function () {
      location.host = host;
    };
  };
};

// ----------------------------------------------------------------------------

exports.hostname = function (location) {
  return function () {
    return location.hostname;
  };
};

exports.setHostname = function (hostname) {
  return function (location) {
    return function () {
      location.hostname = hostname;
    };
  };
};

// ----------------------------------------------------------------------------

exports.href = function (location) {
  return function () {
    return location.href;
  };
};

exports.setHref = function (href) {
  return function (location) {
    return function () {
      location.href = href;
    };
  };
};

// ----------------------------------------------------------------------------

exports.origin = function (location) {
  return function () {
    return location.origin;
  };
};

exports.setOrigin = function (origin) {
  return function (location) {
    return function () {
      location.origin = origin;
    };
  };
};

// ----------------------------------------------------------------------------

exports.pathname = function (location) {
  return function () {
    return location.pathname;
  };
};

exports.setPathname = function (pathname) {
  return function (location) {
    return function () {
      location.pathname = pathname;
    };
  };
};

// ----------------------------------------------------------------------------

exports.port = function (location) {
  return function () {
    return location.port;
  };
};

exports.setPort = function (port) {
  return function (location) {
    return function () {
      location.port = port;
    };
  };
};

// ----------------------------------------------------------------------------

exports.protocol = function (location) {
  return function () {
    return location.protocol;
  };
};

exports.setProtocol = function (protocol) {
  return function (location) {
    return function () {
      location.protocol = protocol;
    };
  };
};

// ----------------------------------------------------------------------------

exports.search = function (location) {
  return function () {
    return location.search;
  };
};

exports.setSearch = function (search) {
  return function (location) {
    return function () {
      location.search = search;
    };
  };
};

// ----------------------------------------------------------------------------

exports.assign = function (url) {
  return function (location) {
    return function () {
      location.assign(url);
    };
  };
};

// ----------------------------------------------------------------------------

exports.replace = function (url) {
  return function (location) {
    return function () {
      location.replace(url);
    };
  };
};

// ----------------------------------------------------------------------------

exports.reload = function (location) {
  return function () {
    location.reload();
  };
};
