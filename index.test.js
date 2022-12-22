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
      $('body').attr('id', 'mybody');
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
  
  doTest('sends to position correctly', (f) => f(tests.insertsAtCorrectPositions, () => {
    const $ = require('jquery');
    expect($('#dyn0').index()).toBeLessThan($('#dyn1').index());
    expect($('#dyn1').index()).toBeLessThan($('#dyn2').index());
    expect($('#dyn2').index()).toBeLessThan($('#dyn3').index());
    expect($('#dyn3').index()).toBeLessThan($('#dyn4').index());
    // for kicks
    expect($('#dyn4').index()).toBeGreaterThan($('#dyn0').index());
  }));
  
  doTest('switcher works for compositional elements', (f) => f(tests.switcherWorksForCompositionalElements, () => {
    const $ = require('jquery');
    expect($('#id0').text()).toBe('0-0');
    expect($('#id1').text()).toBe('0-1');
    expect($('#id2').text()).toBe('0-2');
    $('#incr').trigger("click");
    expect($('#id0').text()).toBe('1-0');
    expect($('#id1').text()).toBe('1-1');
    expect($('#id2').text()).toBe('1-2');
    $('#incr').trigger("click");
    expect($('#id0').text()).toBe('2-0');
    expect($('#id1').text()).toBe('2-1');
    expect($('#id2').text()).toBe('2-2');
  }));
  
  doTest('tabbed navigation with pursx has correct layout', (f) => f(tests.tabbedNavigationWithPursx, () => {
    const $ = require('jquery');
    expect($('#home').text()).toBe('home');
    $('#about-btn').trigger('click')
    expect($('#home').text()).toBe('');
    expect($('#about').text()).toBe('about deku');
    $('#contact-btn').trigger('click')
    expect($('#about').text()).toBe('');
    expect($('#contact').text()).toBe("contact mike at site.com thanks");
  }));
  
  doTest('portals compose', (f) => f(tests.portalsCompose, () => {
    const $ = require('jquery');
    // d0, then abc, then d1, then d2, then the button
    expect($('#maindiv').text()).toBe('d0abcd1d2incr');
    $('#incr').trigger("click");
    // shifts the portal
    expect($('#maindiv').text()).toBe('d0d1abcd2incr');
    $('#incr').trigger("click");
    // shifts the portal
    expect($('#maindiv').text()).toBe('d0d1d2abcincr');
  }));
  
  doTest('pursx composes', (f) => f(tests.pursXComposes, () => {
    const $ = require('jquery');
    expect($('#div0').text()).toBe('début milieu après-milieu fin');
  }));

  doTest('lifecycle events work', (f) => f(tests.lifecycle, () => {
    const $ = require('jquery');
    $('#about-btn').trigger('click')
    expect($('#hack').text()).toBe('hello');
    $('#contact-btn').trigger('click')
    expect($('#hack').text()).toBe('hello');
    $('#home-btn').trigger('click')
    expect($('#hack').text()).toBe('goodbye');
  }));

  doTest('lifecycle has a difference before and after mounting', (f) => f(tests.lifecycleWillAndDidMount, () => {
    const $ = require('jquery');
    expect($('#span1').text()).toBe('');
    expect($('#span2').text()).toBe('42');
  }));
  doTest('attributes are correctly unset', (f) => f(tests.unsetUnsets, () => {
    const $ = require('jquery');
    expect($('#span1').attr('style')).toBe('color:red;');
    $('#unsetter').trigger('click');
    expect($('#span1').attr('style')).toBe(undefined);
  }));
});

