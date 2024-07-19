const tests = require("./output/Test.Main");
const testFriend = require("./output/Test.TestFriend");
const di = require("./output/Deku.Interpret");
const region = require("./output/Deku.Internal.Region");
const doTest = (name, closure, ionly) => {
  (ionly ? it.only : it)(name, async () => {
    await closure(async (myTest, myScript) => {
      if (!myTest) {
        throw new Error(`Cannot find test named ${name}`);
      }
      document.getElementsByTagName("html")[0].innerHTML =
        '<head></head><body id="mybody"></body>';
      tests.runTest(myTest)();
      await myScript(false);
    });
  });
};

const getIndex = (child) => {
  var allNodes = Array.prototype.slice.call(child.parentNode.childNodes);
  return allNodes.indexOf(child);
};

describe("deku", () => {
  afterEach(() => {
    document.getElementsByTagName("html")[0].innerHTML = "";
  });

  describe("low-level interpreters", () => {
    it("makeElementEffect makes an element with the correct tagname", () => {
      const out = di.makeElementEffect(testFriend.nothing, "div");
      expect(out.tagName).toBe("DIV");
    });
    describe("makeText and setText", () => {
      it("makes text", () => {
        const t = di.makeTextEffect(testFriend.just("hello"));
        expect(t.textContent).toBe("hello");
        di.setTextEffect("goodbye", t);
        expect(t.textContent).toBe("goodbye");
      });
    });
    describe("setProp", () => {
      it("sets the id attribute correctly and unsets it correctly", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        di.setPropEffect("id", "foo", elt);
        di.unsetAttributeEffect("id", elt);
        expect($(elt).attr("id")).toBe(undefined);
      });
      it("sets checked attribute correctly", () => {
        const elt = di.makeElementEffect(testFriend.nothing, "input");
        di.setPropEffect("checked", "true", elt);
        expect(elt.checked).toBe(true);
        di.setPropEffect("checked", "false", elt);
        expect(elt.checked).toBe(false);
      });
      it("sets value attribute correctly", () => {
        const elt = di.makeElementEffect(testFriend.nothing, "input");
        di.setPropEffect("value", "hello", elt);
        expect(elt.value).toBe("hello");
      });
      it("sets disabled correctly", () => {
        const elt = di.makeElementEffect(testFriend.nothing, "button");
        di.setPropEffect("disabled", "true",elt);
        expect(elt.disabled).toBe(true);
      });
    });
    describe("setCb and unsetAttribute", () => {
      it("sets and unsets the cb", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "button");
        let i = 0;
        di.setCbEffect("click", () => () => {
          i++;
        }, elt);
        $(elt).trigger("click");
        expect(i).toBe(1);
        di.setCbEffect("click", () => () => {
          i += 42;
        }, elt);
        $(elt).trigger("click");
        expect(i).toBe(43);
        di.unsetAttributeEffect("click", elt);
        $(elt).trigger("click");
        expect(i).toBe(43);
      });
    });
  });
  describe("framework tests", () => {
    doTest("is sane", (f) =>
      f(tests.sanityCheck, () => {
        const $ = require("jquery");
        expect($("#hello").text()).toBe("Hello");
      })
    );

    doTest("two elements render", (f) =>
      f(tests.twoElements, () => {
        const $ = require("jquery");
        expect($("#maindiv").text()).toBe("helloworld");
      })
    );

    doTest("has elements in the correct order", (f) =>
      f(tests.elementsInCorrectOrder, () => {
        const $ = require("jquery");
        expect($("#span1-0").text()).toBe("span1-0A");
        expect($("#span7-1").text()).toBe("span7-1B");
        expect($("#span9-3").text()).toBe("span9-3D");
      })
    );

    doTest(
      "has dyn appearing in the correct composable order when used at beginning",
      (f) =>
        f(tests.dynAppearsCorrectlyAtBeginning, () => {
          const $ = require("jquery");
          // text, span, button
          const base = 3;
          expect($("#div0").contents().length).toEqual(base);
          expect($($("#div0").contents()[0]).text()).toBe("foo");
          expect($($("#div0").contents()[base - 2]).text()).toBe("bar");
          expect($($("#div0").contents()[base - 1]).text()).toBe("incr");
          $($("#div0").contents()[base - 1]).trigger("click");
          expect($("#div0").contents().length).toBe(base + 1);
          // has shifted button by 1
          expect($($("#div0").contents()[base]).text()).toBe("incr");
          // there's a new node now with the number "0" as its text
          expect($($("#div0").contents()[base - 1]).text()).toBe("0");
          // index is now 4 as it has moved back by 1
          $($("#div0").contents()[base]).trigger("click");
          expect($("#div0").contents().length).toBe(base + 2);
          // has again shifted button by 1
          expect($($("#div0").contents()[base + 1]).text()).toBe("incr");
          // there's a new node now with the number "1" as its text
          expect($($("#div0").contents()[base - 1]).text()).toBe("1");
          // the old node is to the after of the new node
          expect($($("#div0").contents()[base - 0]).text()).toBe("0");
        })
    );

    doTest(
      "has dyn appearing in the correct composable order when used at end",
      (f) =>
        f(tests.dynAppearsCorrectlyAtEnd, (usingSSR) => {
          const $ = require("jquery");
          // text, span, start beacon, end beacon, button
          const base = usingSSR ? 4 : 3;
          expect($("#div0").contents().length).toEqual(base);
          expect($($("#div0").contents()[0]).text()).toBe("foo");
          expect($($("#div0").contents()[base - 2]).text()).toBe("bar");
          expect($($("#div0").contents()[base - 1]).text()).toBe("incr");
          $($("#div0").contents()[base - 1]).trigger("click");
          expect($("#div0").contents().length).toBe(base + 1);
          // has shifted button by 1
          expect($($("#div0").contents()[base]).text()).toBe("incr");
          // there's a new node now with the number "0" as its text
          expect($($("#div0").contents()[base - 1]).text()).toBe("0");
          // index is now 5/4 as it has moved back by 1
          $($("#div0").contents()[base]).trigger("click");
          expect($("#div0").contents().length).toBe(base + 2);
          // has again shifted button by 1
          expect($($("#div0").contents()[base + 1]).text()).toBe("incr");
          // there's a new node now with the number "1" as its text
          expect($($("#div0").contents()[base - 0]).text()).toBe("1");
          // the old node is to the left of the new node
          expect($($("#div0").contents()[base - 1]).text()).toBe("0");
        })
    );

    doTest("deeply nested", (f) =>
      f(tests.deeplyNestedPreservesOrder, () => {
        const $ = require("jquery");
        expect($("#incr-0").text()).toBe("incr-0");
        $("#incr-0").trigger("click");
        $("#incr-0").trigger("click");
        expect($("#incr-1").text()).toBe("incr-1");
        $("#incr-1").trigger("click");
        $("#incr-1").trigger("click");
        expect($("#incr-2").text()).toBe("incr-2");
        $("#incr-2").trigger("click");
        $("#incr-2").trigger("click");
        // add dyn0-2 with the third click on incr-0
        $("#incr-0").trigger("click");
        // incr-1 is inserted _above_ incr-0 in the test
        expect($("#incr-1").index()).toBeLessThan($("#incr-0").index());
        expect($("#incr-2").index()).toBeLessThan($("#incr-1").index());
        expect($("#incr-2").index()).toBeLessThan($("#dyn0-2").index());
      })
    );

    doTest("domable is a monoid", (f) =>
      f(tests.isAMonoid, () => {
        const $ = require("jquery");
        expect($("#mybody").text()).toBe("monoid");
      })
    );

    doTest("sends to position", (f) =>
      f(tests.sendsToPosition, () => {
        const $ = require("jquery");
        expect($("#dyn0").index()).toBeLessThan($("#dyn1").index());
        expect($("#dyn1").index()).toBeLessThan($("#dyn2").index());
        expect($("#dyn2").index()).toBeLessThan($("#dyn3").index());
        expect($("#dyn3").index()).toBeLessThan($("#dyn4").index());
        // for kicks
        expect($("#dyn4").index()).toBeGreaterThan($("#dyn0").index());
        $("#pos").trigger("click");
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

    doTest("pursx adds listeners", (f) =>
      f(tests.pursXWiresUp, () => {
        const $ = require("jquery");
        expect($("#span0").text()).toBe("");
        expect($("#topdiv").attr("class")).toBe("arrrrr");
        $("#px").trigger("click");
        expect($("#span0").text()).toBe("hello");
        $("#inny").trigger("click");
        expect($("#span0").text()).toBe("goodbye");
      })
    );
    doTest("pursx adds listeners 2", (f) =>
      f(tests.pursXWiresUp2, () => {
        const $ = require("jquery");
        expect($("#span0").text()).toBe("");
        expect($("#topdiv").attr("class")).toBe("arrrrr");
        $("#px").trigger("click");
        expect($("#span0").text()).toBe("hello");
        $("#inny").trigger("click");
        expect($("#span0").text()).toBe("goodbye");
      })
    );
    doTest("sends to position correctly when elt is fixed", (f) =>
      f(tests.sendsToPositionFixed, () => {
        const $ = require("jquery");
        expect($("#dyn0a").index()).toBeLessThan($("#dyn1a").index());
        expect($("#dyn1a").index()).toBeLessThan($("#dyn2a").index());
        expect($("#dyn2a").index()).toBeLessThan($("#dyn3a").index());
        expect($("#dyn3a").index()).toBeLessThan($("#dyn4a").index());
        // for kicks
        expect($("#dyn4a").index()).toBeGreaterThan($("#dyn0a").index());
        $("#pos").trigger("click");
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

    doTest("sends to initial position correctly", (f) =>
      f(tests.insertsAtCorrectPositions, () => {
        const $ = require("jquery");
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
        const $ = require("jquery");
        expect($("#id0").text()).toBe("0-0");
        expect($("#id1").text()).toBe("0-1");
        expect($("#id2").text()).toBe("0-2");
        $("#incr").trigger("click");
        expect($("#id0").text()).toBe("1-0");
        expect($("#id1").text()).toBe("1-1");
        expect($("#id2").text()).toBe("1-2");
        $("#incr").trigger("click");
        expect($("#id0").text()).toBe("2-0");
        expect($("#id1").text()).toBe("2-1");
        expect($("#id2").text()).toBe("2-2");
      })
    );

    doTest("tabbed navigation with pursx has correct layout", (f) =>
      f(tests.tabbedNavigationWithPursx, () => {
        const $ = require("jquery");
        expect($("#home").text()).toBe("home");
        $("#about-btn").trigger("click");
        expect($("#home").length === 0);
        expect($("#about").text()).toBe("about deku");
        $("#contact-btn").trigger("click");
        expect($("#about").length === 0);
        expect($("#contact").text()).toBe(
          "contact mike at site dot com thanks"
        );
      })
    );

    doTest("switchers compose", (f) =>
      f(tests.switchersCompose, () => {
        const $ = require("jquery");
        expect($("#div1a").index()).toBeGreaterThan($("#div0").index());
        expect($("#div1a").index()).toBeLessThan($("#div2").index());
        $("#incr").trigger("click");
        expect($("#div1b").index()).toBeGreaterThan($("#div0").index());
        expect($("#div1b").index()).toBeLessThan($("#div2").index());
        $("#incr").trigger("click");
        expect($("#div1a").index()).toBeGreaterThan($("#div0").index());
        expect($("#div1a").index()).toBeLessThan($("#div2").index());
      })
    );

    doTest("portals compose", (f) =>
      f(tests.portalsCompose, () => {
        const $ = require("jquery");
        // d0, then abc, then d1, then d2, then the button
        expect($("#maindiv").text()).toBe("d0abcd1d2incr");
        $("#incr").trigger("click");
        // shifts the portal
        expect($("#maindiv").text()).toBe("d0d1abcd2incr");
        $("#incr").trigger("click");
        // shifts the portal
        expect($("#maindiv").text()).toBe("d0d1d2abcincr");
      })
    );

    doTest("switcher switches", (f) =>
      f(tests.switcherSwitches, () => {
        const $ = require("jquery");
        $("#about-btn").trigger("click");
        expect($("#hack").text()).toBe("hello");
        $("#contact-btn").trigger("click");
        expect($("#hack").text()).toBe("hello");
        $("#home-btn").trigger("click");
        expect($("#hack").text()).toBe("goodbye");
      })
    );

    doTest("lots of switching!", (f) =>
      f(tests.lotsOfSwitching, () => {
        const $ = require("jquery");
        expect($("#hack").text()).toBe("hello");
        ////
        $("#home-btn").trigger("click");
        expect($("#hack").text()).toBe("goodbye");
        $("#home-btn").trigger("click");
        expect($("#hack").text()).toBe("hello");
        ////
        $("#home-btn").trigger("click");
        expect($("#hack").text()).toBe("goodbye");
        $("#home-btn").trigger("click");
        expect($("#hack").text()).toBe("hello");
      })
    );

    doTest("attributes are correctly unset", (f) =>
      f(tests.unsetUnsets, () => {
        const $ = require("jquery");
        expect($("#span1").attr("style")).toBe("color:red;");
        $("#unsetter").trigger("click");
        expect($("#span1").attr("style")).toBe(undefined);
      })
    );

    // this test has no assertions - just makes sure that emptiness is
    // typeset without breaking the engine
    doTest("empty text does not break ssr", (f) =>
      f(tests.emptyTextIsSet, () => {})
    );

    doTest("useRef has correct behavior", (f) =>
      f(tests.useRefWorks, () => {
        const $ = require("jquery");
        expect($("#b0").text()).toBe("");
        expect($("#b1").text()).toBe("");
        expect($("#b2").text()).toBe("");
        expect($("#b3").text()).toBe("");
        expect($("#b4").text()).toBe("");
        $("#b3").trigger("click");
        expect($("#b0").text()).toBe("");
        expect($("#b1").text()).toBe("");
        expect($("#b2").text()).toBe("");
        expect($("#b3").text()).toBe("0");
        expect($("#b4").text()).toBe("");
        $("#counter").trigger("click");
        $("#counter").trigger("click");
        $("#b1").trigger("click");
        expect($("#b0").text()).toBe("");
        expect($("#b1").text()).toBe("2");
        expect($("#b2").text()).toBe("");
        expect($("#b3").text()).toBe("0");
        expect($("#b4").text()).toBe("");
        $("#b3").trigger("click");
        expect($("#b0").text()).toBe("");
        expect($("#b1").text()).toBe("2");
        expect($("#b2").text()).toBe("");
        expect($("#b3").text()).toBe("2");
        expect($("#b4").text()).toBe("");
      })
    );

    doTest("useRef hook can simulate hot events", (f) =>
      f(tests.refToHot, () => {
        const $ = require("jquery");
        // first, set the label to "bar"
        $("#setlabel").trigger("click");
        // then, click a bunch of stuff
        $("#button0").trigger("click");
        $("#button1").trigger("click");
        $("#button2").trigger("click");
        $("#button3").trigger("click");
        $("#button4").trigger("click");
        $("#button5").trigger("click");
        $("#button6").trigger("click");
        // as the poll is hot, we get the most recent value
        expect($("#myspan").text()).toBe("bar");
      })
    );

    doTest("useHot is hotttt", (f) =>
      f(tests.hotIsHot, () => {
        const $ = require("jquery");
        // first, set the label to "bar"
        $("#setlabel").trigger("click");
        // then, click a bunch of stuff
        $("#button0").trigger("click");
        $("#button1").trigger("click");
        $("#button2").trigger("click");
        $("#button3").trigger("click");
        $("#button4").trigger("click");
        $("#button5").trigger("click");
        $("#button6").trigger("click");
        // as the poll is hot, we get the most recent value
        expect($("#myspan").text()).toBe("bar");
      })
    );

    doTest("simple switcher", (f) =>
      f(tests.simpleSwitcher, () => {
        const $ = require("jquery");
        expect($("#innertrue").text()).toBe("trueswitch");
        $("#doswitch").trigger("click");
        expect($("#innerfalse").text()).toBe("falseswitch");
        $("#doswitch").trigger("click");
        expect($("#innertrue").text()).toBe("trueswitch");
      })
    );

    doTest("useHot changes its value", (f) =>
      f(tests.useHotWorks, () => {
        const $ = require("jquery");
        expect($("#hotdiv").text()).toBe("0.42");
        $("#ba").trigger("click");
        const nw = $("#hotdiv").text();
        expect(nw).not.toBe("0.42");
        $("#bb").trigger("click");
        expect($("#newdiv").text()).toBe(nw);
      })
    );

    doTest("useState works #2", (f) =>
      f(tests.useStateWorks2, () => {
        const $ = require("jquery");
        expect($("#hotdiv").text()).toBe("0.42");
        $("#ba").trigger("click");
        const nw = $("#hotdiv").text();
        expect(nw).not.toBe("0.42");
        $("#bb").trigger("click");
        expect($("#newdiv").text()).toBe("0.42");
      })
    );

    doTest("todo mvc", (f) =>
      f(tests.todoMVC, async () => {
        const $ = require("jquery");
        // because of the injectElementT
        await new Promise((resolve) => setTimeout(resolve, 42.0));
        $("#add").trigger("click");
        expect($("#item0").text()).toBe("Tasko primo");
      })
    );

    doTest("useEffect with a ref has correct behavior", (f) =>
      f(tests.useEffectCanBeSimulatedWithRef, () => {
        const $ = require("jquery");
        expect($("#mydiv").text()).toBe("0");
        $("#counter").trigger("click");
        expect($("#mydiv").text()).toBe("2");
        $("#counter").trigger("click");
        expect($("#mydiv").text()).toBe("3");
        $("#counter").trigger("click");
        expect($("#mydiv").text()).toBe("4");
        $("#counter").trigger("click");
        expect($("#mydiv").text()).toBe("6");
      })
    );

    doTest("custom hooks do their thing", (f) =>
      f(tests.customHooksDoTheirThing, () => {
        const $ = require("jquery");
        $("#counter").trigger("click");
        expect($("#mydiv1").text()).toBe("43");
        expect($("#mydiv2").text()).toBe("49");
      })
    );

    doTest("used state works", (f) =>
      f(tests.useStateWorks, () => {
        const $ = require("jquery");
        expect($("#maindiv").text()).toBe("hello");
        $("#button").trigger("click");
        expect($("#maindiv").text()).toBe("world");
      })
    );

    doTest("use rant works", (f) =>
      f(tests.useRantWorks, () => {
        const $ = require("jquery");
        $("#button").trigger("click");
        expect($("#maindiv").text()).toBe("0");
        expect($("#maindiv2").text()).toBe("0");
        $("#button").trigger("click");
        expect($("#maindiv").text()).toBe("1");
        expect($("#maindiv2").text()).toBe("1");
        $("#button").trigger("click");
        expect($("#maindiv").text()).toBe("2");
        expect($("#maindiv2").text()).toBe("2");
        $("#button").trigger("click");
        expect($("#maindiv").text()).toBe("3");
        expect($("#maindiv2").text()).toBe("3");
        $("#button").trigger("click");
        expect($("#maindiv").text()).toBe("4");
        expect($("#maindiv2").text()).toBe("4");
      })
    );

    doTest("pure works", (f) =>
      f(tests.pureWorks, () => {
        const $ = require("jquery");
        expect($("#hello").text()).toBe("hello");
      })
    );
    doTest("useRant works", (f) =>
      f(tests.useHotRantWorks, () => {
        const $ = require("jquery");
        expect($("#da").text()).toBe("1");
        $("#update").trigger("click");
        expect($("#da").text()).toBe("2");
        $("#update").trigger("click");
        expect($("#da").text()).toBe("3");
        $("#reveal").trigger("click");
        expect($("#da").text()).toBe("3");
        expect($("#db").text()).toBe("3");
        $("#update").trigger("click");
        expect($("#da").text()).toBe("4");
        expect($("#db").text()).toBe("4");
      })
    );

    doTest( "deterministic unsub", ( f ) =>
      f( tests.disposeGetsRun, () => {
        const $ = require( "jquery" );
        expect( $( "#notthere" ).length ).toBe( 1 );
        expect( $( "#count" ).text() ).toBe( "1" );

        $( "#notthere" ).trigger( "click" );

        expect( $( "#notthere" ).length ).toBe( 0 ); // element is gone so its unsubs should have been called
        expect( $( "#count" ).text() ).toBe( "2" ); // one tick for the init and one tick for the unsub
      })
    );
  });
});
