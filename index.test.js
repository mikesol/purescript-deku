const tests = require('./output/Test.Main');

describe('deku', () => {
  afterEach(() => {
    document.getElementsByTagName('html')[0].innerHTML = '';
  });

  it('is sane', () => {
    document.getElementsByTagName('html')[0].innerHTML = '<head></head><body></body>';
    const $ = require('jquery');
    const finished = tests.sanityCheck();
    expect($('#hello').text()).toBe('Hello');
    finished();
  });

  it('has elements in the correct order', () => {
    document.getElementsByTagName('html')[0].innerHTML = '<head></head><body></body>';
    const $ = require('jquery');
    const finished = tests.elementsInCorrectOrder();
    expect($('#span1-0').text()).toBe('span1-0A');
    expect($('#span7-1').text()).toBe('span7-1B');
    expect($('#span9-3').text()).toBe('span9-3D');
    finished();
  });

  it('has dyn appearing in the correct composable order', () => {
    document.getElementsByTagName('html')[0].innerHTML = '<head></head><body></body>';
    const $ = require('jquery');
    const finished = tests.dynAppearsCorrectly();
    // text, span, start beacon, end beacon, button
    expect($('#div0').contents().length).toBe(5);
    expect($($('#div0').contents()[0]).text()).toBe("foo");
    expect($($('#div0').contents()[1]).text()).toBe("bar");
    expect($($('#div0').contents()[4]).text()).toBe("incr");
    $($('#div0').contents()[4]).trigger("click");
    expect($('#div0').contents().length).toBe(6);
    // has shifted button by 1
    expect($($('#div0').contents()[5]).text()).toBe("incr");
    // there's a new node now with the number "0" as its text
    expect($($('#div0').contents()[3]).text()).toBe("0");
    // index is now 5 as it has moved back by 1
    $($('#div0').contents()[5]).trigger("click");
    expect($('#div0').contents().length).toBe(7);
    // has again shifted button by 1
    expect($($('#div0').contents()[6]).text()).toBe("incr");
    // there's a new node now with the number "1" as its text
    expect($($('#div0').contents()[4]).text()).toBe("1");
    finished();
  });

});