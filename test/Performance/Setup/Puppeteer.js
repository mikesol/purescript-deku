const puppeteer = require("puppeteer");
const filterConsole = require("filter-console");
const tracealyzer = require("tracealyzer");
const { getPerformanceModel } = require("headless-devtools");

exports.filterConsole = function () {
  filterConsole(["Failed to parse CPU profile."]);
};

exports.launchImpl = function (args) {
  return function () {
    return puppeteer.launch(args);
  };
};

exports.newPageImpl = function (browser) {
  return browser.newPage();
};

exports.debugImpl = function (page) {
  page.on("console", (msg) => console.log("PAGE LOG:", msg.text()));
  page.on("pageerror", (err) => console.log("ERROR LOG:", err.message));
};

exports.clickImpl = function (elem) {
  return elem.click();
};

exports.waitForSelectorImpl = function (page, selector) {
  return page.waitForSelector(selector);
};

exports.focusImpl = function (page, selector) {
  return page.focus(selector);
};

exports.typeWithKeybordImpl = function (page, string) {
  return page.keyboard.type(string);
};

exports.gotoImpl = function (page, path) {
  return page.goto(path);
};

exports.closePageImpl = function (page) {
  return page.close();
};

exports.closeBrowserImpl = function (browser) {
  return browser.close();
};

exports.enableHeapProfilerImpl = function (page) {
  return page._client.send("HeapProfiler.enable");
};

exports.collectGarbageImpl = function (page) {
  return page._client.send("HeapProfiler.collectGarbage");
};

exports.startTraceImpl = function (page, path) {
  return page.tracing.start({ path });
};

exports.stopTraceImpl = function (page) {
  return page.tracing.stop();
};

// Should be used on the trace produced by `page.tracing.stop()`
exports.getPerformanceModelImpl = function (trace) {
  try {
    const traceJSON = JSON.parse(trace.toString());
    return getPerformanceModel(traceJSON);
  } catch (e) {
    return null;
  }
};

// Should be used on the model returned by `getPeformanceModel`
exports.getAverageFPS = function (model) {
  const frames = model.frames();
  const durations = frames.map((x) => x.duration);
  const avg = durations.reduce((acc, item) => acc + item, 0) / durations.length;
  return Math.round(1000 / avg);
};

exports.pageMetricsImpl = function (page) {
  return page.metrics();
};

exports.tracealyzer = function (filename) {
  return function () {
    return tracealyzer(filename);
  };
};
