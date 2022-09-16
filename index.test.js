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

});