const tests = require('./output/Test.Main');

const doTest = (name, closure, onlyWithSSR) => {
  (onlyWithSSR === false ? it.only : it)(name + ' without SSR', () => {
    closure((myTest, myScript) => {
      document.getElementsByTagName('html')[0].innerHTML = '<head></head><body id=\"mybody\"></body>';
      const finished = tests.runNoSSR(myTest)();
      myScript(false);
      finished();
    });
  });
  (onlyWithSSR === true ? it.only : it)(name + ' with SSR', () => {
    closure((myTest, myScript) => {
      const myHtml = tests.ssr(myTest)();
      document.getElementsByTagName('html')[0].innerHTML = myHtml;
      const $ = require('jquery');
      $('body').attr('id','mybody');
      const finished = tests.runWithSSR(myTest)();
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

  doTest('deeply nested', (f) => f(tests.deeplyNestedPreservesOrder, () => {
    const $ = require('jquery');
    expect($('#incr-0').text()).toBe('incr-0');
    $('#incr-0').trigger("click");
    $('#incr-0').trigger("click");
    expect($('#incr-1').text()).toBe('incr-1');
    $('#incr-1').trigger("click");
    $('#incr-1').trigger("click");
    expect($('#incr-2').text()).toBe('incr-2');
    $('#incr-2').trigger("click");
    $('#incr-2').trigger("click");
    // add dyn0-2 with the third click on incr-0
    $('#incr-0').trigger("click");
    // incr-1 is inserted _above_ incr-0 in the test
    expect($('#incr-1').index()).toBeLessThan($('#incr-0').index());
    expect($('#incr-2').index()).toBeLessThan($('#incr-1').index());
    expect($('#incr-2').index()).toBeLessThan($('#dyn0-2').index());
  }));
});

doTest('domable is a monoid', (f) => f(tests.isAMonoid, () => {
  const $ = require('jquery');
  expect($('#mybody').text()).toBe('monoid');
}));

doTest('sends to position correctly', (f) => f(tests.sendsToPosition, () => {
  const $ = require('jquery');
  expect($('#dyn0').index()).toBeLessThan($('#dyn1').index());
  expect($('#dyn1').index()).toBeLessThan($('#dyn2').index());
  expect($('#dyn2').index()).toBeLessThan($('#dyn3').index());
  expect($('#dyn3').index()).toBeLessThan($('#dyn4').index());
  // for kicks
  expect($('#dyn4').index()).toBeGreaterThan($('#dyn0').index());
  $('#pos').trigger("click");
  // 3 is now at 1
  // so the order is 0, 3, 1, 2, 4
  expect($('#dyn0').index()).toBeLessThan($('#dyn3').index());
  expect($('#dyn3').index()).toBeLessThan($('#dyn1').index());
  expect($('#dyn1').index()).toBeLessThan($('#dyn2').index());
  expect($('#dyn2').index()).toBeLessThan($('#dyn4').index());
  // for kicks
  expect($('#dyn4').index()).toBeGreaterThan($('#dyn0').index());
}));

doTest('sends to position correctly when elt is fixed', (f) => f(tests.sendsToPositionFixed, () => {
  const $ = require('jquery');
  expect($('#dyn0a').index()).toBeLessThan($('#dyn1a').index());
  expect($('#dyn1a').index()).toBeLessThan($('#dyn2a').index());
  expect($('#dyn2a').index()).toBeLessThan($('#dyn3a').index());
  expect($('#dyn3a').index()).toBeLessThan($('#dyn4a').index());
  // for kicks
  expect($('#dyn4a').index()).toBeGreaterThan($('#dyn0a').index());
  $('#pos').trigger("click");
  // 3 is now at 1
  // so the order is 0, 3, 1, 2, 4
  expect($('#dyn0a').index()).toBeLessThan($('#dyn3a').index());
  expect($('#dyn3a').index()).toBeLessThan($('#dyn1a').index());
  expect($('#dyn1a').index()).toBeLessThan($('#dyn2a').index());
  expect($('#dyn2a').index()).toBeLessThan($('#dyn4a').index());
  // for kicks
  expect($('#dyn4a').index()).toBeGreaterThan($('#dyn0a').index());
}));

