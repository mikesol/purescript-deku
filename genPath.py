DEBUG = False
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
    A = None
    if n < 0:
        A = ''
    else:
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
    C=None
    if n < 0:
        C = ''
    else:
      C = "{0:b}".format(d)
      C = ("0" * (n + 1 - len(C))) + C
      C = C.replace("0", "X").replace("1", "Y")
    T = ''
    LT = 0
    for x in C:
        if x == 'X':
            T = '.firstElementChild' + T
        elif x == 'Y':
            T = ".nextElementSibling" + T
        LT += 1
    fullDown = f'e.firstElementChild{T}'
    fullNext = f'e.nextElementSibling{T}'
    downs = ('e','e.firstElementChild') if LT == 0 else (fullDown[:fullDown.rfind('.firstElementChild')], 'start'+ fullDown[fullDown.rfind('.firstElementChild'):] )
    nexts = ('p','e.nextElementSibling') if LT == 0 else ('p',fullNext) if 'firstElementChild' not in fullNext else (fullNext[:fullNext.rfind('.firstElementChild')], 'start'+ fullNext[fullNext.rfind('.firstElementChild'):] )
    return f'''
export const {C.lower()}{'D' if n >= 0 else 'd'}ownGroup = ({{p,e}}) => {{ const start = {downs[0]}; {f"console.log('{C.lower()}{'D' if n >= 0 else 'd'}ownGroup', start.outerHTML,{downs[1]} ? {downs[1]}.outerHTML : 'NO_E');" if DEBUG else ""} return {{ p: start, e: {downs[1]} }}}};
export const {C.lower()}{'R' if n >= 0 else 'r'}ightGroup = ({{p,e}}) => {{ const start = {nexts[0]}; {f"console.log('{C.lower()}{'R' if n >= 0 else 'r'}ightGroup', start.outerHTML,{nexts[1]}? {nexts[1]}.outerHTML : 'NO_E');" if DEBUG else ""} return {{ p: {'start' if n >= 0 else 'p' }, e: {nexts[1]} }}}};
    '''

def genJJ(n, d):
    C = None
    if n < 0:
        C=''
    else:
      C = "{0:b}".format(d)
      C = ("0" * (n + 1 - len(C))) + C
      C = C.replace("0", "X").replace("1", "Y")
    return f'''foreign import {C.lower()}{'D' if n >= 0 else 'd'}ownGroup :: EffectFn1 MElement MElement
foreign import {C.lower()}{'R' if n >= 0 else 'r'}ightGroup :: EffectFn1 MElement MElement
'''

def genP(n, d):
    C = None
    if n < 0:
        C = ''
    else:
      C = "{0:b}".format(d)
      C = ("0" * (n + 1 - len(C))) + C
      C = C.replace("0", "X").replace("1", "Y")
    DB = lambda x: f'let _ = spy "{C}{x}" true' if DEBUG else ''
    T = f"""---
instance PathWalker a r => PathWalker (Path.{C}DownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    {DB("DownGroup")}
    p <- runEffectFn1 {C.lower()}{"D" if n >= 0 else "d"}ownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.{C}RightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    {DB("RightGroup")}
    p <- runEffectFn1 {C.lower()}{"R" if n >= 0 else "r"}ightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.{C}ContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    {DB("ContGroupWithMarkers")}
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.{C}TwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    {DB("TwoContGroups")}
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.{C}TwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    {DB("TwoContGroupsWithMarkers")}
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
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
    oprint(genC(-1, -1))
    for x in range(R - 2):
        oprint(f"---- level {x}")
        for y in range(2 << x):
            oprint(genC(x, y))
    oprint("\n\n---- final\n")
    oprint("""instance Scrunch (MarkerGroup a) (MarkerGroup a)
instance (Scrunch b c) => Scrunch (ContGroupWithMarkers a b) (ContGroupWithMarkers a c)
instance (Scrunch a c, Scrunch b d) => Scrunch (TwoContGroups a b) (TwoContGroups c d)
instance (Scrunch a c, Scrunch b d) => Scrunch (TwoContGroupsWithMarkers z a b) (TwoContGroupsWithMarkers z c d)

""")
    for y in range(2 << (R-1)):
        oprint(genT(R-1, y))
    #####
    qprint(f"""module Deku.PathWalker where

import Prelude
{"import Debug(spy)" if DEBUG else ""}
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

foreign import processString :: EffectFn3 String String MElement Unit
foreign import mEltElt :: MElement -> Element
foreign import mEltParent :: MElement -> Element
foreign import splitTextAndReturnReplacement :: EffectFn2 String  MElement Text

class PathWalker :: Path.Path -> Row Type -> Constraint
class PathWalker p r | p -> r where
  walk :: EffectFn4 (Proxy p) {{ | r }} DOMInterpret MElement Unit

class ProcessInstruction :: Symbol -> Type -> Constraint
class ProcessInstruction s i where
  processInstruction :: EffectFn4 (Proxy s) i DOMInterpret MElement Unit

class ProcessInstructions :: Row Type -> RL.RowList Symbol -> Constraint
class ProcessInstructions r rl | rl -> r where
  processInstructions :: EffectFn4 (Proxy rl) {{ | r }} DOMInterpret MElement Unit

instance ProcessInstructions r RL.Nil where
  processInstructions = mkEffectFn4 \_ _ _ _ -> pure unit

instance (ProcessInstructions r a) => PathWalker (Path.MarkerGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    {'let _ = spy "MarkerGroup" r' if DEBUG else ''}
    runEffectFn4 processInstructions (Proxy :: _ a) r di e

instance (IsSymbol k, R.Cons k v r' r, ProcessInstruction k v, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k k c) where
  processInstructions = mkEffectFn4 \_ r di e -> do
      runEffectFn4 processInstruction (Proxy :: _ k) (get (Proxy :: _ k) r) di e
      runEffectFn4 processInstructions (Proxy :: _ c) r di e

instance IsSymbol k => ProcessInstruction k String where
  processInstruction = mkEffectFn4 \\k s _ e -> do
    {'let _ = spy ("PIString@") {s,e}' if DEBUG else ''}
    runEffectFn3 processString (reflectSymbol k) s e

instance ProcessInstruction k (Poll (Attribute e)) where
  processInstruction = mkEffectFn4 \\_ att di e -> do
    {'let _ = spy ("PIAtt@") e' if DEBUG else ''}
    obj <- liftST STObject.new
    star <- liftST $ STArray.new
    handleAtts di obj (toDekuElement (mEltElt e)) star
      [  att ]

instance IsSymbol k => ProcessInstruction k Nut where
  processInstruction = mkEffectFn4 \\k (Nut nut) di@(DOMInterpret {{ makeElement }}) e -> do
    {'let _ = spy ("PINut") e' if DEBUG else ''}
    fauxPar <- runEffectFn2 makeElement Nothing (Tag "template")
    let par = mEltParent e
    o <- runEffectFn2 nut (PSR {{ unsubs: [], parent: fauxPar, beacon: Nothing, fromPortal: false }}) di
    t <- runEffectFn2 splitTextAndReturnReplacement (reflectSymbol k) e
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
    jprint(genJ(-1, -1))
    qprint(genJJ(-1, -1))
    for x in range(R):
        qprint(f"---- level {x}")
        for y in range(2 << x):
            jprint(genJ(x, y))
            qprint(genJJ(x, y))
    jprint(f'''
export const processString = (k, s, {{p,e}}) => {{
  {'console.log("processString", e ? e.outerHTML: `NO_E `+p.outerHTML);' if DEBUG else ''}
  // Get the previous sibling (text node) of the element
  let textNode = e ? e.previousSibling : p.lastChild;
  {'console.log("processString", s, textNode, textNode.textContent);' if DEBUG else ''}

  // Ensure the previous sibling is actually a text node. If it isn't, this will not work.
  if (textNode && textNode.nodeType === 3) {{  // 3 is the nodeType for a Text node
    let replacement = s;
    if (replacement !== undefined) {{
      textNode.nodeValue = textNode.nodeValue.replace("~" + k + "~", replacement);
    }} else {{
      console.error("Programming error: no replacement for " + k + " found in object");
    }}
  }} else {{
    console.error("Programming error: previous node not a text node");
  }}
}};
export const mEltElt = x => x.e;
export const mEltParent = x => x.p;
export const splitTextAndReturnReplacement = (s, {{p,e}}) => {{
  {'console.log("splitTextAndReturnReplacement", e ? e.outerHTML: `NO_E `+p.outerHTML);' if DEBUG else ''}
  // Get the previous sibling (text node) of the element
  let textNode = e ? e.previousSibling : p.lastChild;
  {'console.log("splitTextAndReturnReplacementPREV", textNode, textNode.textContent);' if DEBUG else ''}
  if (textNode && textNode.nodeType === 3) {{  // 3 is the nodeType for a Text node
    let targetString = "~" + s + "~";
    let index = textNode.nodeValue.indexOf(targetString);

    if (index !== -1) {{
      // Split the text node at the starting index of the target string
      let afterTextNode = textNode.splitText(index);

      // Split the afterTextNode at the end index of the target string to isolate it
      afterTextNode.splitText(targetString.length);

      // Return the newly created text node containing the target string
      return afterTextNode;
    }}
  }}

  throw new Error("Programming error: previous node not a text node or target string not found: "+s);
}};

''')
    R = 6
    qprint("----------- new section")
    qprint(genP(-1, -1))
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

        