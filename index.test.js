const tests = require("./output/Test.Main");

const doTest = (name, closure, onlyWithSSR) => {
  (onlyWithSSR === false ? it.only : it)(name + " without SSR", () => {
    closure((myTest, myScript) => {
      if (!myTest) {
        throw new Error(`Cannot find test named ${name}`);
      }
      document.getElementsByTagName("html")[0].innerHTML =
        '<head></head><body id="mybody"></body>';
      const finished = tests.runNoSSR(myTest)(
        isNaN(onlyWithSSR) ? 0 : onlyWithSSR
      )();
      myScript(false);
      finished();
    });
  });
  (onlyWithSSR === true ? it.only : it)(name + " with SSR", () => {
    closure((myTest, myScript) => {
      if (!myTest) {
        throw new Error(`Cannot find test named ${name}`);
      }
      const myHtml = tests.ssr(myTest)();
      document.getElementsByTagName("html")[0].innerHTML = myHtml;
      document.body.setAttribute("id", "mybody");
      const finished = tests.runWithSSR(myTest)(
        isNaN(onlyWithSSR) ? 0 : onlyWithSSR
      )();
      myScript(true);
      finished();
    });
  });
};

const getChildIndex = (child) => {
  let i = 0;
  while ((child = child.previousElementSibling) !== null) {
      i++;
  }
  return i;
}

const resolveIdentish = (ident) => typeof ident === "string" ? document.querySelector(ident) : ident;

const $$ = (ident) => ({
  text: () => resolveIdentish(ident).textContent,
  click: () => resolveIdentish(ident).click(),
  index: () => getChildIndex(resolveIdentish(ident)),
  attr: (key) => resolveIdentish(ident).getAttribute(key),
  contents: () => resolveIdentish(ident).childNodes,
  selectorIsNull: () => resolveIdentish(ident) === null
});

describe("deku", () => {
  afterEach(() => {
    document.getElementsByTagName("html")[0].innerHTML = "";
  });

  doTest("is sane", (f) =>
    f(tests.sanityCheck, () => {
      const $ = $$;
      expect($("#hello").text()).toBe("Hello");
    })
  );

  doTest("two elements render", (f) =>
    f(tests.twoElements, () => {
      const $ = $$;
      expect($("#maindiv").text()).toBe("helloworld");
    })
  );

  doTest("has elements in the correct order", (f) =>
    f(tests.elementsInCorrectOrder, () => {
      const $ = $$;
      expect($("#span1-0").text()).toBe("span1-0A");
      expect($("#span7-1").text()).toBe("span7-1B");
      expect($("#span9-3").text()).toBe("span9-3D");
    })
  );

  doTest(
    "has dyn appearing in the correct composable order when used at beginning",
    (f) =>
      f(tests.dynAppearsCorrectlyAtBeginning, (usingSSR) => {
        const $ = $$;
        // text, span, start beacon, end beacon, button
        const base = usingSSR ? 6 : 5;
        expect($("#div0").contents().length).toBe(base);
        expect($($("#div0").contents()[0]).text()).toBe("foo");
        expect($($("#div0").contents()[base - 4]).text()).toBe("bar");
        expect($($("#div0").contents()[base - 1]).text()).toBe("incr");
        $($("#div0").contents()[base - 1]).click();
        expect($("#div0").contents().length).toBe(base + 1);
        // has shifted button by 1
        expect($($("#div0").contents()[base]).text()).toBe("incr");
        // there's a new node now with the number "0" as its text
        expect($($("#div0").contents()[base - 2]).text()).toBe("0");
        // index is now 5 as it has moved back by 1
        $($("#div0").contents()[base]).click();
        expect($("#div0").contents().length).toBe(base + 2);
        // has again shifted button by 1
        expect($($("#div0").contents()[base + 1]).text()).toBe("incr");
        // there's a new node now with the number "1" as its text
        expect($($("#div0").contents()[base - 2]).text()).toBe("1");
        // the old node is to the right of the new node
        expect($($("#div0").contents()[base - 1]).text()).toBe("0");
      })
  );

  doTest(
    "has dyn appearing in the correct composable order when used at end",
    (f) =>
      f(tests.dynAppearsCorrectlyAtEnd, (usingSSR) => {
        const $ = $$;
        // text, span, start beacon, end beacon, button
        const base = usingSSR ? 6 : 5;
        expect($("#div0").contents().length).toBe(base);
        expect($($("#div0").contents()[0]).text()).toBe("foo");
        expect($($("#div0").contents()[base - 4]).text()).toBe("bar");
        expect($($("#div0").contents()[base - 1]).text()).toBe("incr");
        $($("#div0").contents()[base - 1]).click();
        expect($("#div0").contents().length).toBe(base + 1);
        // has shifted button by 1
        expect($($("#div0").contents()[base]).text()).toBe("incr");
        // there's a new node now with the number "0" as its text
        expect($($("#div0").contents()[base - 2]).text()).toBe("0");
        // index is now 5 as it has moved back by 1
        $($("#div0").contents()[base]).click();
        expect($("#div0").contents().length).toBe(base + 2);
        // has again shifted button by 1
        expect($($("#div0").contents()[base + 1]).text()).toBe("incr");
        // there's a new node now with the number "1" as its text
        expect($($("#div0").contents()[base - 1]).text()).toBe("1");
        // the old node is to the left of the new node
        expect($($("#div0").contents()[base - 2]).text()).toBe("0");
      })
  );

  doTest("deeply nested", (f) =>
    f(tests.deeplyNestedPreservesOrder, () => {
      const $ = $$;
      expect($("#incr-0").text()).toBe("incr-0");
      $("#incr-0").click();
      $("#incr-0").click();
      expect($("#incr-1").text()).toBe("incr-1");
      $("#incr-1").click();
      $("#incr-1").click();
      expect($("#incr-2").text()).toBe("incr-2");
      $("#incr-2").click();
      $("#incr-2").click();
      // add dyn0-2 with the third click on incr-0
      $("#incr-0").click();
      // incr-1 is inserted _above_ incr-0 in the test
      expect($("#incr-1").index()).toBeLessThan($("#incr-0").index());
      expect($("#incr-2").index()).toBeLessThan($("#incr-1").index());
      expect($("#incr-2").index()).toBeLessThan($("#dyn0-2").index());
    })
  );

  doTest("domable is a monoid", (f) =>
    f(tests.isAMonoid, () => {
      const $ = $$;
      expect($("#mybody").text()).toBe("monoid");
    })
  );

  doTest("sends to position correctly", (f) =>
    f(tests.sendsToPosition, () => {
      const $ = $$;
      expect($("#dyn0").index()).toBeLessThan($("#dyn1").index());
      expect($("#dyn1").index()).toBeLessThan($("#dyn2").index());
      expect($("#dyn2").index()).toBeLessThan($("#dyn3").index());
      expect($("#dyn3").index()).toBeLessThan($("#dyn4").index());
      // for kicks
      expect($("#dyn4").index()).toBeGreaterThan($("#dyn0").index());
      $("#pos").click();
      // 3 is now at 1
      // so the order is 0, 3, 1, 2, 4
      expect($("#dyn0").index()).toBeLessThan($("#dyn3").index());
      expect($("#dyn3").index()).toBeLessThan($("#dyn1").index());
      expect($("#dyn1").index()).toBeLessThan($("#dyn2").index());
      expect($("#dyn2").index()).toBeLessThan($("#dyn4").index());
      // for kicks
      expect($("#dyn4").index()).toBeGreaterThan($("#dyn0").index());
    })
  );

  doTest("sends to position correctly when elt is fixed", (f) =>
    f(tests.sendsToPositionFixed, () => {
      const $ = $$;
      expect($("#dyn0a").index()).toBeLessThan($("#dyn1a").index());
      expect($("#dyn1a").index()).toBeLessThan($("#dyn2a").index());
      expect($("#dyn2a").index()).toBeLessThan($("#dyn3a").index());
      expect($("#dyn3a").index()).toBeLessThan($("#dyn4a").index());
      // for kicks
      expect($("#dyn4a").index()).toBeGreaterThan($("#dyn0a").index());
      $("#pos").click();
      // 3 is now at 1
      // so the order is 0, 3, 1, 2, 4
      expect($("#dyn0a").index()).toBeLessThan($("#dyn3a").index());
      expect($("#dyn3a").index()).toBeLessThan($("#dyn1a").index());
      expect($("#dyn1a").index()).toBeLessThan($("#dyn2a").index());
      expect($("#dyn2a").index()).toBeLessThan($("#dyn4a").index());
      // for kicks
      expect($("#dyn4a").index()).toBeGreaterThan($("#dyn0a").index());
    })
  );

  doTest("sends to position correctly", (f) =>
    f(tests.insertsAtCorrectPositions, () => {
      const $ = $$;
      expect($("#dyn0").index()).toBeLessThan($("#dyn1").index());
      expect($("#dyn1").index()).toBeLessThan($("#dyn2").index());
      expect($("#dyn2").index()).toBeLessThan($("#dyn3").index());
      expect($("#dyn3").index()).toBeLessThan($("#dyn4").index());
      // for kicks
      expect($("#dyn4").index()).toBeGreaterThan($("#dyn0").index());
    })
  );

  doTest("switcher works for compositional elements", (f) =>
    f(tests.switcherWorksForCompositionalElements, () => {
      const $ = $$;
      expect($("#id0").text()).toBe("0-0");
      expect($("#id1").text()).toBe("0-1");
      expect($("#id2").text()).toBe("0-2");
      $("#incr").click();
      expect($("#id0").text()).toBe("1-0");
      expect($("#id1").text()).toBe("1-1");
      expect($("#id2").text()).toBe("1-2");
      $("#incr").click();
      expect($("#id0").text()).toBe("2-0");
      expect($("#id1").text()).toBe("2-1");
      expect($("#id2").text()).toBe("2-2");
    })
  );

  doTest("tabbed navigation with pursx has correct layout", (f) =>
    f(tests.tabbedNavigationWithPursx, () => {
      const $ = $$;
      expect($("#home").text()).toBe("home");
      $("#about-btn").click();
      expect($("#home").selectorIsNull());
      expect($("#about").text()).toBe("about deku");
      $("#contact-btn").click();
      expect($("#about").selectorIsNull());
      expect($("#contact").text()).toBe("contact mike at site.com thanks");
    })
  );

  doTest("switchers compose", (f) =>
    f(tests.switchersCompose, () => {
      const $ = $$;
      expect($("#div1a").index()).toBeGreaterThan($("#div0").index());
      expect($("#div1a").index()).toBeLessThan($("#div2").index());
      $("#incr").click();
      expect($("#div1b").index()).toBeGreaterThan($("#div0").index());
      expect($("#div1b").index()).toBeLessThan($("#div2").index());
      $("#incr").click();
      expect($("#div1a").index()).toBeGreaterThan($("#div0").index());
      expect($("#div1a").index()).toBeLessThan($("#div2").index());
    })
  );

  doTest("portals compose", (f) =>
    f(tests.portalsCompose, () => {
      const $ = $$;
      // d0, then abc, then d1, then d2, then the button
      expect($("#maindiv").text()).toBe("d0abcd1d2incr");
      $("#incr").click();
      // shifts the portal
      expect($("#maindiv").text()).toBe("d0d1abcd2incr");
      $("#incr").click();
      // shifts the portal
      expect($("#maindiv").text()).toBe("d0d1d2abcincr");
    })
  );

  doTest("global portals retain portalness when sent out of scope", (f) =>
    f(tests.globalPortalsRetainPortalnessWhenSentOutOfScope, () => {
      const $ = $$;
      expect($("#outer-scope").text()).toBe("no dice!");
      expect($("#inner-scope").text()).toBe("foo");
      $("#portal-btn").click();
      expect($("#outer-scope").text()).toBe("foo");
      expect($("#inner-scope").text()).toBe("no dice!");
      $("#portal-btn").click();
      // starting from the second click, the top stops receiving events
      // which means that the portal should never flip back to it
      // we do this in the test to make sure that the portal is
      // referentially opaque, meaning that even without an event
      // firing it still disappears from its old setting
      expect($("#outer-scope").text()).toBe("");
      expect($("#inner-scope").text()).toBe("foo");
      $("#portal-btn").click();
      expect($("#outer-scope").text()).toBe("");
      expect($("#inner-scope").text()).toBe("no dice!");
      $("#portal-btn").click();
      expect($("#outer-scope").text()).toBe("");
      expect($("#inner-scope").text()).toBe("foo");
    })
  );

  doTest("local portals lose portalness when sent out of scope", (f) =>
    f(tests.localPortalsLosePortalnessWhenSentOutOfScope, () => {
      const $ = $$;
      expect($("#outer-scope").text()).toBe("no dice!");
      expect($("#inner-scope").text()).toBe("foo");
      $("#portal-btn").click();
      expect($("#outer-scope").text()).toBe("foo");
      expect($("#inner-scope").text()).toBe("no dice!");
      $("#portal-btn").click();
      // starting from the second click, the top stops receiving events
      // unlike the test above, which is identical except for the
      // local/global portal split
      // the "foo" should linger in the outer scope
      // because a fresh constructor is used
      expect($("#outer-scope").text()).toBe("foo");
      expect($("#inner-scope").text()).toBe("foo");
      $("#portal-btn").click();
      expect($("#outer-scope").text()).toBe("foo");
      expect($("#inner-scope").text()).toBe("no dice!");
      $("#portal-btn").click();
      expect($("#outer-scope").text()).toBe("foo");
      expect($("#inner-scope").text()).toBe("foo");
    })
  );

  doTest("pursx composes", (f) =>
    f(tests.pursXComposes, () => {
      const $ = $$;
      expect($("#div0").text()).toBe("début milieu après-milieu fin");
    })
  );

  doTest("switcher switches", (f) =>
    f(tests.switcherSwitches, () => {
      const $ = $$;
      $("#about-btn").click();
      expect($("#hack").text()).toBe("hello");
      $("#contact-btn").click();
      expect($("#hack").text()).toBe("hello");
      $("#home-btn").click();
      expect($("#hack").text()).toBe("goodbye");
    })
  );

  doTest(
    "lots of switching!",
    (f) =>
      f(tests.lotsOfSwitching, () => {
        const $ = $$;
        expect($("#hack").text()).toBe("hello");
        ////
        $("#home-btn").click();
        expect($("#hack").text()).toBe("goodbye");
        $("#home-btn").click();
        expect($("#hack").text()).toBe("hello");
        ////
        $("#home-btn").click();
        expect($("#hack").text()).toBe("goodbye");
        $("#home-btn").click();
        expect($("#hack").text()).toBe("hello");
      })
  );

  doTest("attributes are correctly unset", (f) =>
    f(tests.unsetUnsets, () => {
      const $ = $$;
      expect($("#span1").attr("style")).toBe("color:red;");
      $("#unsetter").click();
      expect($("#span1").attr("style")).toBe(null);
    })
  );

  // this test has no assertions - just makes sure that emptiness is
  // typeset without breaking the engine
  doTest("empty text does not break ssr", (f) =>
    f(tests.emptyTextIsSet, () => {})
  );

  doTest("useRef has correct behavior", (f) =>
    f(tests.useRefWorks, () => {
      const $ = $$;
      expect($("#b0").text()).toBe("");
      expect($("#b1").text()).toBe("");
      expect($("#b2").text()).toBe("");
      expect($("#b3").text()).toBe("");
      expect($("#b4").text()).toBe("");
      $("#b3").click();
      expect($("#b0").text()).toBe("");
      expect($("#b1").text()).toBe("");
      expect($("#b2").text()).toBe("");
      expect($("#b3").text()).toBe("0");
      expect($("#b4").text()).toBe("");
      $("#counter").click();
      $("#counter").click();
      $("#b1").click();
      expect($("#b0").text()).toBe("");
      expect($("#b1").text()).toBe("2");
      expect($("#b2").text()).toBe("");
      expect($("#b3").text()).toBe("0");
      expect($("#b4").text()).toBe("");
      $("#b3").click();
      expect($("#b0").text()).toBe("");
      expect($("#b1").text()).toBe("2");
      expect($("#b2").text()).toBe("");
      expect($("#b3").text()).toBe("2");
      expect($("#b4").text()).toBe("");
    })
  );

  doTest("useRef hook can simulate hot events", (f) =>
    f(tests.refToHot, () => {
      const $ = $$;
      // first, set the label to "bar"
      $("#setlabel").click();
      // then, click a bunch of stuff
      $("#button0").click();
      $("#button1").click();
      $("#button2").click();
      $("#button3").click();
      $("#button4").click();
      $("#button5").click();
      $("#button6").click();
      // as the poll is hot, we get the most recent value
      expect($("#myspan").text()).toBe("bar");
    })
  );

  doTest("useHot is hotttt", (f) =>
    f(tests.hotIsHot, () => {
      const $ = $$;
      // first, set the label to "bar"
      $("#setlabel").click();
      // then, click a bunch of stuff
      $("#button0").click();
      $("#button1").click();
      $("#button2").click();
      $("#button3").click();
      $("#button4").click();
      $("#button5").click();
      $("#button6").click();
      // as the poll is hot, we get the most recent value
      expect($("#myspan").text()).toBe("bar");
    })
  );

  doTest("simple switcher", (f) =>
    f(tests.simpleSwitcher, () => {
      const $ = $$;
      expect($("#innertrue").text()).toBe("trueswitch");
      $("#doswitch").click();
      expect($("#innerfalse").text()).toBe("falseswitch");
      $("#doswitch").click();
      expect($("#innertrue").text()).toBe("trueswitch");
    })
  );

  doTest("useEffect has correct behavior", (f) =>
    f(tests.useEffectWorks, () => {
      const $ = $$;
      expect($("#mydiv").text()).toBe("0");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("2");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("3");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("4");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("6");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("7");
    })
  );

  doTest("useEffect with a ref has correct behavior", (f) =>
    f(tests.useEffectWorksWithRef, () => {
      const $ = $$;
      expect($("#mydiv").text()).toBe("0");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("2");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("3");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("4");
      $("#counter").click();
      expect($("#mydiv").text()).toBe("6");
    })
  );

  doTest("custom hooks do their thing", (f) =>
    f(tests.customHooksDoTheirThing, () => {
      const $ = $$;
      $("#counter").click();
      expect($("#mydiv1").text()).toBe("43");
      expect($("#mydiv2").text()).toBe("49");
    })
  );

  doTest("used state works", (f) =>
    f(tests.useStateWorks, () => {
      const $ = $$;
      expect($("#maindiv").text()).toBe("hello");
      $("#button").click();
      expect($("#maindiv").text()).toBe("world");
    })
  );

  doTest("use rant works", (f) =>
    f(tests.useRantWorks, () => {
      const $ = $$;
      $("#button").click();
      expect($("#maindiv").text()).toBe("0");
      expect($("#maindiv2").text()).toBe("0");
      $("#button").click();
      expect($("#maindiv").text()).toBe("1");
      expect($("#maindiv2").text()).toBe("1");
      $("#button").click();
      expect($("#maindiv").text()).toBe("2");
      expect($("#maindiv2").text()).toBe("2");
      $("#button").click();
      expect($("#maindiv").text()).toBe("3");
      expect($("#maindiv2").text()).toBe("3");
      $("#button").click();
      expect($("#maindiv").text()).toBe("4");
      expect($("#maindiv2").text()).toBe("4");
    })
  );

  doTest("pure works", (f) =>
    f(tests.pureWorks, () => {
      const $ = $$;
      expect($("#hello").text()).toBe("hello");
    })
  );
});
