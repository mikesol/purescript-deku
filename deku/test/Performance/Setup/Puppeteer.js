import puppeteer from "puppeteer";
import filterConsole from "filter-console";
import tracealyzer from "tracealyzer";
import { getPerformanceModel } from "headless-devtools";

export function filterConsoleImpl() {
	filterConsole(["Failed to parse CPU profile."]);
}

export function launchImpl(args) {
	return function () {
		return puppeteer.launch(args);
	};
}

export function newPageImpl(browser) {
	return browser.newPage();
}

export function debugImpl(page) {
	page.on("console", (msg) => console.log("PAGE LOG:", msg.text()));
	page.on("pageerror", (err) => console.log("ERROR LOG:", err.message));
}

export function clickImpl(elem) {
	return elem.click();
}

export function waitForSelectorImpl(page, selector) {
	return page.waitForSelector(selector);
}

export function getInputFieldValueImpl(page, selector) {
	return page.$eval(selector, (input) => {
		return input.value;
	});
}

export function getCheckedImpl(page, selector) {
	return page.$eval(selector, (input) => {
		return input.checked;
	});
}

export function focusImpl(page, selector) {
	return page.focus(selector);
}

export function typeWithKeybordImpl(page, string) {
	return page.keyboard.type(string);
}

export function gotoImpl(page, path) {
	return page.goto(path);
}

export function closePageImpl(page) {
	return page.close();
}

export function closeBrowserImpl(browser) {
	return browser.close();
}

export function enableHeapProfilerImpl(page) {
	return page._client.send("HeapProfiler.enable");
}

export function collectGarbageImpl(page) {
	return page._client.send("HeapProfiler.collectGarbage");
}

export function startTraceImpl(page, path) {
	return page.tracing.start({ path });
}

export function stopTraceImpl(page) {
	return page.tracing.stop();
}

// Should be used on the trace produced by `page.tracing.stop()`
export function getPerformanceModelImpl(trace) {
	try {
		const traceJSON = JSON.parse(trace.toString());
		return getPerformanceModel(traceJSON);
	} catch (e) {
		return null;
	}
}

// Should be used on the model returned by `getPeformanceModel`
export function getAverageFPS(model) {
	const frames = model.frames();
	const durations = frames.map((x) => x.duration);
	const avg = durations.reduce((acc, item) => acc + item, 0) / durations.length;
	return Math.round(1000 / avg);
}

export function pageMetricsImpl(page) {
	return page.metrics();
}

export function tracealyzerImpl(filename) {
	return function () {
		return tracealyzer(filename);
	};
}
