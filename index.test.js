const tests = require("./output/Test.Main");
const testFriend = require("./output/Test.TestFriend");
const di = require("./output/Deku.Interpret");
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
    describe("attributeDynParentForElementEffect,", () => {
      it("attriubtes correctly when pos is 0 and no children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(0)
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(1);
        expect(getIndex(cBeacon)).toBe(2);
      });
      it("attriubtes correctly when pos is 1 and no children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(1)
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(1);
        expect(getIndex(cBeacon)).toBe(2);
      });
      it("attriubtes correctly when pos is 42 and no children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(42)
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(1);
        expect(getIndex(cBeacon)).toBe(2);
      });
      it("attriubtes correctly when pos is Nothing and no children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.nothing
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(1);
        expect(getIndex(cBeacon)).toBe(2);
      });
      /////
      it("attriubtes correctly when pos is 0 and several children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(0)
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(1);
        expect(getIndex(cBeacon)).toBe(n + 2);
      });
      it("attriubtes correctly when pos is 25 and several children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const mpos = 25;
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(mpos)
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(mpos + 1);
        expect(getIndex(cBeacon)).toBe(n + 2);
      });
      it("attriubtes correctly when pos is 138 and only 42 children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(138)
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(n + 1);
        expect(getIndex(cBeacon)).toBe(n + 2);
      });
      it("attriubtes correctly when pos is Nothing and 42 children present", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.nothing
        );
        expect(getIndex(oBeacon)).toBe(0);
        expect(getIndex(elt)).toBe(n + 1);
        expect(getIndex(cBeacon)).toBe(n + 2);
      });
      //////
      it("attriubtes correctly when pos is 0, several children are present, and there are elements on the left and right", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(0)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + 1);
        expect(getIndex(cBeacon)).toBe(j + n + 2);
      });
      it("attriubtes correctly when pos is 38, several children are present, and there are elements on the left and right", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        const mpos = 38;
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(mpos)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + mpos + 1);
        expect(getIndex(cBeacon)).toBe(j + n + 2);
      });
      it("attriubtes correctly when pos is 4242, not that many children are present, and there are elements on the left and right", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        const mpos = 4242;
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(mpos)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + 2);
      });
      it("attriubtes correctly when pos is Nothing, not that many children are present, and there are elements on the left and right", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.nothing
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + 2);
      });
      /////
      it("attriubtes correctly when pos is 0, stuff is on the left and right, and there are many nested empty dyns", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 42;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeElementParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeElementParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(0)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + 1);
        expect(getIndex(cBeacon)).toBe(j + n + n + 2);
      });
      /////
      it("attriubtes correctly when pos is 1, stuff is on the left and right, and there are many nested empty dyns", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 17;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(1)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + n + 2);
      });
      it("attriubtes correctly when pos is 2, stuff is on the left and right, and there are many nested empty dyns", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 19;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(2)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + n + 2);
      });
      it("attriubtes correctly when pos is Nothing, stuff is on the left and right, and there are many nested empty dyns", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 5;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.nothing
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + n + 2);
      });
      ////
      it("attriubtes correctly when pos is 1, stuff is on the left and right, and there are many nested empty dyns twice over", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 16;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(1)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + n + n + n + 2);
      });
      it("attriubtes correctly when pos is 2, stuff is on the left and right, and there are many nested empty dyns twice over", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 9;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(2)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + n + n + n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + n + n + n + n + 2);
      });
      ////
      it("attriubtes correctly when pos is 1, stuff is on the left and right, and there are many nested dyns twice over with elements inside of them", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 16;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const elt3 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt3, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(1)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + 2 * n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + 2 * n + n + 3 * n + n + 2);
      });
      it("attriubtes correctly when pos is 2, stuff is on the left and right, and there are many nested dyns twice over with elements inside of them", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 16;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const elt3 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt3, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForElementEffect(
          testFriend.unlucky(),
          elt,
          oBeacon,
          cBeacon,
          testFriend.just(2)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(elt)).toBe(j + 2 * n + n + 3 * n + n + 1);
        expect(getIndex(cBeacon)).toBe(j + 2 * n + n + 3 * n + n + 2);
      });
    });
    describe("attributeDynParentForBeaconsEffect", () => {
      it("attriubtes correctly when pos is 1, stuff is on the left and right, and there are many nested dyns twice over with elements inside of them", () => {
        const $ = require("jquery");
        const newOBeacon = di.makeOpenBeaconEffect();
        const newCBeacon = di.makeOpenBeaconEffect();
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 16;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const elt3 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt3, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForBeaconsEffect(
          newOBeacon,
          newCBeacon,
          oBeacon,
          cBeacon,
          testFriend.just(1)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(newOBeacon)).toBe(j + 2 * n + n + 1);
        expect(getIndex(newCBeacon)).toBe(j + 2 * n + n + 2);
        expect(getIndex(cBeacon)).toBe(j + 2 * n + n + 3 * n + n + 3);
      });
      it("attriubtes correctly when pos is 2, stuff is on the left and right, and there are many nested dyns twice over with elements inside of them", () => {
        const $ = require("jquery");
        const newOBeacon = di.makeOpenBeaconEffect();
        const newCBeacon = di.makeOpenBeaconEffect();
        const oBeacon = di.makeOpenBeaconEffect();
        const cBeacon = di.makeCloseBeaconEffect();
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeBeaconParentEffect(oBeacon, parent);
        const n = 16;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const elt3 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt3, parent);
        }
        for (var i = 0; i < n; i++) {
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
        }
        di.attributeBeaconParentEffect(cBeacon, parent);
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        di.attributeDynParentForBeaconsEffect(
          newOBeacon,
          newCBeacon,
          oBeacon,
          cBeacon,
          testFriend.just(2)
        );
        expect(getIndex(oBeacon)).toBe(j);
        expect(getIndex(newOBeacon)).toBe(j + 2 * n + n + 3 * n + n + 1);
        expect(getIndex(newCBeacon)).toBe(j + 2 * n + n + 3 * n + n + 2);
        expect(getIndex(cBeacon)).toBe(j + 2 * n + n + 3 * n + n + 3);
      });
    });
    describe("attributeBeaconFullRangeParentEffect", () => {
      it("correctly inserts all dyn elements into parent", () => {
        const $ = require("jquery");
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        const n = 43;
        let oBeacon;
        let cBeacon;
        const offset = 26;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          if (i == offset) {
            oBeacon = od2;
          }
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
        }
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const elt3 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt3, parent);
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          if (i == n - 1 - offset) {
            cBeacon = od2;
          }
        }
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        // new parent
        const newParent = di.makeElementEffect(testFriend.nothing, "ul");
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, newParent);
        }
        expect(newParent.childNodes.length).toBe(j);
        di.attributeBeaconFullRangeParentEffect(oBeacon, newParent);
        expect(getIndex(oBeacon)).toBe(j);
        const t = n - offset;
        expect(getIndex(cBeacon)).toBe(j + 5 * t - 1);
        expect(newParent.lastChild).toEqual(cBeacon);
      });
    });
    describe("attributeDynParentForBeaconFullRangeEffect", () => {
      it("correctly inserts all dyn elements into parent", () => {
        const $ = require("jquery");
        const parent = di.makeElementEffect(testFriend.nothing, "ul");
        const j = 7;
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        const n = 30;
        let oBeacon;
        let cBeacon;
        const offset = 15;
        for (var i = 0; i < n; i++) {
          const od2 = di.makeOpenBeaconEffect();
          if (i == offset) {
            oBeacon = od2;
          }
          di.attributeBeaconParentEffect(od2, parent);
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
        }
        for (var i = 0; i < n; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt2, parent);
          const elt3 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeBeaconParentEffect(elt3, parent);
          const od2 = di.makeCloseBeaconEffect();
          di.attributeBeaconParentEffect(od2, parent);
          if (i == n - 1 - offset) {
            cBeacon = od2;
          }
        }
        const k = 108;
        for (var i = 0; i < k; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, parent);
        }
        // new parent
        const newParent = di.makeElementEffect(testFriend.nothing, "ul");
        const newOBeacon = di.makeOpenBeaconEffect();
        di.attributeBeaconParentEffect(newOBeacon, newParent);
        for (var i = 0; i < j; i++) {
          const elt2 = di.makeElementEffect(testFriend.nothing, "li");
          di.attributeElementParentEffect(elt2, newParent);
        }
        const newCBeacon = di.makeCloseBeaconEffect();
        di.attributeBeaconParentEffect(newCBeacon, newParent);
        expect(newParent.childNodes.length).toBe(j + 2); // j + ob + cb
        di.attributeDynParentForBeaconFullRangeEffect(
          oBeacon,
          newOBeacon,
          newCBeacon,
          testFriend.just(0)
        );
        expect(getIndex(oBeacon)).toBe(1);
        const t = n - offset;
        expect(getIndex(cBeacon)).toBe(1 + 5 * t - 1);
      });
    });
    describe("makeText and setText", () => {
      it("makes text", () => {
        const { txt } = di.makeTextEffect(testFriend.just("hello"));
        expect(txt.textContent).toBe("hello");
        di.setTextEffect(txt, "goodbye");
        expect(txt.textContent).toBe("goodbye");
      });
    });
    describe("setProp", () => {
      it("sets the id attribute correctly and unsets it correctly", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "li");
        let cache = testFriend.nothing;
        di.setPropEffect(elt, "id", "foo");
        di.unsetAttributeEffect(
          elt,
          "id",
          () => cache,
          () => (cache = nothing)
        );
        expect($(elt).attr("id")).toBe(undefined);
      });
      it("sets checked attribute correctly", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "input");
        di.setPropEffect(elt, "checked", "true");
        expect(elt.checked).toBe(true);
        di.setPropEffect(elt, "checked", "false");
        expect(elt.checked).toBe(false);
      });
      it("sets value attribute correctly", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "input");
        di.setPropEffect(elt, "value", "hello");
        expect(elt.value).toBe("hello");
      });
      it("sets disabled correctly", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "button");
        di.setPropEffect(elt, "disabled", "true");
        expect(elt.disabled).toBe(true);
      });
    });
    describe("setCb and unsetAttribute", () => {
      it("sets and unsets the cb", () => {
        const $ = require("jquery");
        const elt = di.makeElementEffect(testFriend.nothing, "button");
        let i = 0;
        di.setCbEffect(
          elt,
          "click",
          () => () => {
            i++;
          },
        );
        $(elt).trigger("click");
        expect(i).toBe(1);
        di.setCbEffect(
          elt,
          "click",
          () => () => {
            i += 42;
          },
        );
        $(elt).trigger("click");
        expect(i).toBe(43);
        di.unsetAttributeEffect(
          elt,
          "click",
        );
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
          // text, span, start beacon, end beacon, button
          const base = 5;
          expect($("#div0").contents().length).toBe(base);
          expect($($("#div0").contents()[0]).text()).toBe("foo");
          expect($($("#div0").contents()[base - 4]).text()).toBe("bar");
          expect($($("#div0").contents()[base - 1]).text()).toBe("incr");
          $($("#div0").contents()[base - 1]).trigger("click");
          expect($("#div0").contents().length).toBe(base + 1);
          // has shifted button by 1
          expect($($("#div0").contents()[base]).text()).toBe("incr");
          // there's a new node now with the number "0" as its text
          expect($($("#div0").contents()[base - 2]).text()).toBe("0");
          // index is now 5 as it has moved back by 1
          $($("#div0").contents()[base]).trigger("click");
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
          const $ = require("jquery");
          // text, span, start beacon, end beacon, button
          const base = usingSSR ? 6 : 5;
          expect($("#div0").contents().length).toBe(base);
          expect($($("#div0").contents()[0]).text()).toBe("foo");
          expect($($("#div0").contents()[base - 4]).text()).toBe("bar");
          expect($($("#div0").contents()[base - 1]).text()).toBe("incr");
          $($("#div0").contents()[base - 1]).trigger("click");
          expect($("#div0").contents().length).toBe(base + 1);
          // has shifted button by 1
          expect($($("#div0").contents()[base]).text()).toBe("incr");
          // there's a new node now with the number "0" as its text
          expect($($("#div0").contents()[base - 2]).text()).toBe("0");
          // index is now 5 as it has moved back by 1
          $($("#div0").contents()[base]).trigger("click");
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

    doTest("sends to position correctly", (f) =>
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

    doTest("templates work", (f) =>
      f(tests.templatesWork, () => {
        const $ = require("jquery");
        expect($("#div0").text()).toBe(
          "hello Helsinkixhello Stockholmxhello Copenhagenx"
        );
        $("#Stockholm").trigger("click");
        expect($("#div0").text()).toBe(
          "hello Stockholmxhello Helsinkixhello Copenhagenx"
        );
      })
    );
    doTest("templates work 2", (f) =>
      f(tests.templatesWork2, () => {
        const $ = require("jquery");
        expect($("#testing").text()).toBe(
          "hello world"
        );
      })
    );
    doTest("ocarina pursx doesn't crash", (f) =>
      f(tests.ocarinaExample, () => {
        const $ = require("jquery");
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

    doTest("sends to position correctly", (f) =>
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

    doTest("pursx composes", (f) =>
      f(tests.pursXComposes, () => {
        const $ = require("jquery");
        expect($("#div0").text()).toBe("début milieu après-milieu fin");
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
    doTest("stress test doesn't blow up", (f) =>
      f(tests.stressTest, () => {
        const $ = require("jquery");
        $("#runlots").trigger("click");
      })
    );
  });
});
