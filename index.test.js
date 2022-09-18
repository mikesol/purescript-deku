const tests = require('./output/Test.Main');

const doTest = (name, closure, onlyWithSSR) => {
  (onlyWithSSR === false ? it.only : it)(name + ' without SSR', () => {
    closure((myTest, myScript) => {
      document.getElementsByTagName('html')[0].innerHTML = '<head></head><body></body>';
      const finished = tests.runNoSSR(myTest)();
      myScript(false);
      finished();
    });
  });
  (onlyWithSSR === true ? it.only : it)(name + ' with SSR', () => {
    closure((myTest, myScript) => {
      const myHtml = tests.ssr(myTest)();
      console.log("WHOLE", myHtml);
      document.getElementsByTagName('html')[0].innerHTML = myHtml;
      const finished = tests.runWithSSR(myTest)();
      console.log("AFTER", document.documentElement.outerHTML);
      myScript(true);
      finished();
    });
  });
}

describe('deku', () => {
  afterEach(() => {
    document.getElementsByTagName('html')[0].innerHTML = '';
  });

  doTest('is sane', (f) => f(tests.sanityCheck, () => {
    const $ = require('jquery');
    expect($('#hello').text()).toBe('Hello');
  }));

  doTest('has elements in the correct order', (f) => f(tests.elementsInCorrectOrder, () => {
    const $ = require('jquery');
    expect($('#span1-0').text()).toBe('span1-0A');
    expect($('#span7-1').text()).toBe('span7-1B');
    expect($('#span9-3').text()).toBe('span9-3D');
  }));

  doTest('has dyn appearing in the correct composable order', (f) => f(tests.dynAppearsCorrectly, (usingSSR) => {
    const $ = require('jquery');
    // text, span, start beacon, end beacon, button
    const base = usingSSR ? 6 : 5;
    expect($('#div0').contents().length).toBe(base);
    expect($($('#div0').contents()[0]).text()).toBe("foo");
    expect($($('#div0').contents()[base - 4]).text()).toBe("bar");
    expect($($('#div0').contents()[base - 1]).text()).toBe("incr");
    $($('#div0').contents()[base - 1]).trigger("click");
    expect($('#div0').contents().length).toBe(base + 1);
    // has shifted button by 1
    expect($($('#div0').contents()[base]).text()).toBe("incr");
    // there's a new node now with the number "0" as its text
    expect($($('#div0').contents()[base - 2]).text()).toBe("0");
    // index is now 5 as it has moved back by 1
    $($('#div0').contents()[base]).trigger("click");
    expect($('#div0').contents().length).toBe(base + 2);
    // has again shifted button by 1
    expect($($('#div0').contents()[base + 1]).text()).toBe("incr");
    // there's a new node now with the number "1" as its text
    expect($($('#div0').contents()[base - 1]).text()).toBe("1");
  }));
});