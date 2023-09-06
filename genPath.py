def genD(n, d):
    C = "{0:b}".format(d)
    C = ("0" * (n + 1 - len(C))) + C
    C = C.replace("0", "X").replace("1", "Y")
    T = f"""foreign import data {C}DownGroup :: Path -> Path
foreign import data {C}RightGroup :: Path -> Path
foreign import data {C}ContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data {C}TwoContGroups :: Path -> Path -> Path
foreign import data {C}TwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---
"""
    return T


def genC(n, d):
    C = "{0:b}".format(d)
    C = ("0" * (n + 1 - len(C))) + C
    A = C.replace("0", "X").replace("1", "Y")
    T = f"""

instance (Scrunch (X{A}DownGroup a) o) => Scrunch ({A}DownGroup (DownGroup a)) o
instance (Scrunch (Y{A}DownGroup a) o) => Scrunch ({A}DownGroup (RightGroup a)) o
instance Scrunch ({A}DownGroup (MarkerGroup a)) ({A}DownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch ({A}DownGroup (ContGroupWithMarkers a b)) ({A}DownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch ({A}DownGroup (TwoContGroups a b)) ({A}DownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch ({A}DownGroup (TwoContGroupsWithMarkers z a b)) ({A}DownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (X{A}RightGroup a) o) => Scrunch ({A}RightGroup (DownGroup a)) o
instance (Scrunch (Y{A}RightGroup a) o) => Scrunch ({A}RightGroup (RightGroup a)) o
instance Scrunch ({A}RightGroup (MarkerGroup a)) ({A}RightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch ({A}RightGroup (ContGroupWithMarkers a b)) ({A}RightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch ({A}RightGroup (TwoContGroups a b)) ({A}RightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch ({A}RightGroup (TwoContGroupsWithMarkers z a b)) ({A}RightGroup (TwoContGroupsWithMarkers z c d))
"""
    return T


def genT(n, d):
    C = "{0:b}".format(d)
    C = ("0" * (n + 1 - len(C))) + C
    A = C.replace("0", "X").replace("1", "Y")
    T = f"""
instance Scrunch ({A}DownGroup a) ({A}DownGroup a)
instance Scrunch ({A}RightGroup a) ({A}RightGroup a)
instance Scrunch ({A}ContGroupWithMarkers a b) ({A}ContGroupWithMarkers a b)
instance Scrunch ({A}TwoContGroups a b) ({A}TwoContGroups a b)
instance Scrunch ({A}TwoContGroupsWithMarkers z a b) ({A}TwoContGroupsWithMarkers z a b)
"""
    return T


def genJ(n, d):
    C = "{0:b}".format(d)
    C = ("0" * (n + 1 - len(C))) + C
    C = C.replace("0", "X").replace("1", "Y")
    T = ''
    for x in C:
        if x == 'X':
            T = T + '.firstElementChild'
        elif x == 'Y':
            T = T + ".nextElementSibling"
    fullDown = f'x.firstElementChild{T}'
    fullNext = f'x.nextElementSibling{T}'
    downs = ('.'.join(fullDown.split('.')[:-1]), fullDown.split('.')[-1])
    nexts = ('.'.join(fullNext.split('.')[:-1]), fullNext.split('.')[-1])
    return f'''export const {C.lower()}DownGroup = x => {{ const start = {downs[0]}; return {{ p: start, e: start.{downs[1]} }}}};
export const {C.lower()}RightGroup = x => {{ const start = {nexts[0]}; return {{ p: start, e: start.{nexts[1]} }}}};
    '''

def genJJ(n, d):
    C = "{0:b}".format(d)
    C = ("0" * (n + 1 - len(C))) + C
    C = C.replace("0", "X").replace("1", "Y")
    return f'''foreign import {C.lower()}DownGroup :: EffectFn1 MElement MElement
foreign import {C.lower()}RightGroup :: EffectFn1 MElement MElement
'''

def genP(n, d):
    C = "{0:b}".format(d)
    C = ("0" * (n + 1 - len(C))) + C
    C = C.replace("0", "X").replace("1", "Y")
    T = f"""---
instance PathWalker a r => PathWalker (Path.{C}DownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    p <- runEffectFn1 {C.lower()}DownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.{C}RightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    p <- runEffectFn1 {C.lower()}RightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (RL.RowToList r rl, ProcessInstructions r rl, PathWalker a r) => PathWalker (Path.{C}ContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    runEffectFn4 processInstructions (Proxy :: _ rl) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.{C}TwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, RL.RowToList r rl, ProcessInstructions r rl) => PathWalker (Path.{C}TwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    runEffectFn4 processInstructions (Proxy :: _ rl) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
"""
    return T
O = []


def oprint(s):
    O.append(s)

J = []


def jprint(s):
    J.append(s)

Q = []


def qprint(s):
    Q.append(s)

if __name__ == '__main__':
    R = 6
    oprint("----------- new section")
    for x in range(R):
        oprint(f"---- level {x}")
        for y in range(2 << x):
            oprint(genD(x, y))
    oprint("\n\nclass Scrunch (i :: Path) (o :: Path) | i -> o\n\n")
    for x in range(R - 2):
        oprint(f"---- level {x}")
        for y in range(2 << x):
            oprint(genC(x, y))
    oprint("\n\n---- final\n")
    oprint("\ninstance Scrunch (MarkerGroup a) (MarkerGroup a)\n")
    for y in range(2 << (R-1)):
        oprint(genT(R-1, y))
    #####
    qprint("""module Deku.PathWalker where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Array.ST as STArray
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute)
import Deku.Core (DOMInterpret(..), DekuOutcome(..), Nut(..), PSR(..), Tag(..), handleAtts)
import Deku.Interpret (attributeBeaconFullRangeParentProto, fromDekuBeacon, fromDekuElement, fromDekuText, toDekuElement)
import Deku.Path as Path
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, mkEffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import FRP.Poll (Poll)
import Foreign.Object.ST as STObject
import Prim.Row as R
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))
import Web.DOM (Element, Text)
import Web.DOM.ChildNode (remove)
import Web.DOM.Comment as Comment
import Web.DOM.Element as Element
import Web.DOM.Node (replaceChild)
import Deku.UnsafeDOM (insertBefore)
import Web.DOM.Text as Text

data MElement

foreign import processString :: forall r. EffectFn3 String r MElement Unit
foreign import mEltElt :: MElement -> Element
foreign import mEltParent :: MElement -> Element
foreign import splitTextAndReturnReplacement :: EffectFn2 String  MElement Text

class PathWalker :: Path.Path -> Row Type -> Constraint
class PathWalker p r | p -> r where
  walk :: EffectFn4 (Proxy p) { | r } DOMInterpret MElement Unit

class ProcessInstructions :: Row Type -> RL.RowList Type -> Constraint
class ProcessInstructions r rl | rl -> r where
  processInstructions :: EffectFn4 (Proxy rl) { | r } DOMInterpret MElement Unit

instance (RL.RowToList r rl, ProcessInstructions r rl) => PathWalker (Path.MarkerGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    runEffectFn4 processInstructions (Proxy :: _ rl) r di e

instance (IsSymbol k, R.Cons k v r' r, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k String c) where
  processInstructions = mkEffectFn4 \_ r _ e -> do
    runEffectFn3 processString (reflectSymbol (Proxy :: _ k)) r e

instance (IsSymbol k, R.Cons k (Poll (Attribute e)) r' r, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k (Poll (Attribute e)) c) where
  processInstructions = mkEffectFn4 \_ r di e -> do
    obj <- liftST STObject.new
    star <- liftST $ STArray.new
    handleAtts di obj (toDekuElement (mEltElt e)) star
      [  get (Proxy :: _ k) r ]

instance (IsSymbol k, R.Cons k Nut r' r, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k Nut c) where
  processInstructions = mkEffectFn4 \_ r di@(DOMInterpret { makeElement }) e -> do
    fauxPar <- runEffectFn2 makeElement Nothing (Tag "template")
    let Nut nut = get (Proxy :: _ k) r
    let par = mEltParent e
    o <- runEffectFn2 nut (PSR { unsubs: [], parent: fauxPar, beacon: Nothing, fromPortal: false }) di
    t <- runEffectFn2 splitTextAndReturnReplacement (reflectSymbol (Proxy :: _ k)) e
    case o of
      DekuElementOutcome eo -> replaceChild
        (Element.toNode (fromDekuElement eo))
        (Text.toNode t)
        (Element.toNode par)
      DekuTextOutcome to -> replaceChild
        (Text.toNode (fromDekuText to))
        (Text.toNode t)
        (Element.toNode par)
      DekuBeaconOutcome bo -> do
        runEffectFn3
          attributeBeaconFullRangeParentProto
          false
          ( \i -> runEffectFn3 insertBefore i
              (Text.toNode t)
              (Element.toNode par)
          )
          (Comment.toNode (fromDekuBeacon bo))
        remove (Text.toChildNode t)
      NoOutcome -> pure unit
""")
    for x in range(R):
        qprint(f"---- level {x}")
        for y in range(2 << x):
            jprint(genJ(x, y))
            qprint(genJJ(x, y))
    jprint('''
export const processString = (s, r, e) => {
  // Get the previous sibling of the element
  let textNode = e.previousSibling;

  // Ensure the previous sibling is actually a text node. If it isn't, this will not work.
  if (textNode && textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
    let replacement = r[s];
    if (replacement !== undefined) {
      textNode.nodeValue = textNode.nodeValue.replace("~" + s + "~", replacement);
    } else {
      console.error("Programming error: no replacement for " + s + " found in object");
    }
  } else {
    console.error("Programming error: previous node not a text node");
  }
};
export const mEltElt = x => x.e;
export const mEltParent = x => x.p;
export const splitTextAndReturnReplacement = (s, e) => {
  // Get the previous sibling (text node) of the element
  let textNode = e.previousSibling;

  if (textNode && textNode.nodeType === 3) {  // 3 is the nodeType for a Text node
    let targetString = "~" + s + "~";
    let index = textNode.nodeValue.indexOf(targetString);

    if (index !== -1) {
      // Split the text node at the starting index of the target string
      let afterTextNode = textNode.splitText(index);

      // Split the afterTextNode at the end index of the target string to isolate it
      afterTextNode.splitText(targetString.length);

      // Return the newly created text node containing the target string
      return afterTextNode;
    }
  }

  throw new Error("Programming error: previous node not a text node or target string not found: "+s);
};

''')
    R = 6
    qprint("----------- new section")
    for x in range(R):
        qprint(f"---- level {x}")
        for y in range(2 << x):
            qprint(genP(x, y))

    with open("deku-core/src/Deku/Path.purs", "r") as f:
        SC = '---------------------- start codegen'
        a = f.read().split(SC)[0]+SC+'\n\n'
        a += '\n'.join(O)
        with open("deku-core/src/Deku/Path.purs", "w") as ff:
            ff.write(a)
        with open("deku-core/src/Deku/PathWalker.purs", "w") as ff:
            ff.write('\n'.join(Q))
        with open("deku-core/src/Deku/PathWalker.js", "w") as ff:
            ff.write('\n'.join(J))

        