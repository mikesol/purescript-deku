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
    nexts = ('e.parentNode','e.nextElementSibling') if LT == 0 else ('e',fullNext) if 'firstElementChild' not in fullNext else (fullNext[:fullNext.rfind('.firstElementChild')], 'start'+ fullNext[fullNext.rfind('.firstElementChild'):] )
    return f'''
export const {C.lower()}{'D' if n >= 0 else 'd'}ownGroup = (e) => {{ const start = {downs[0]}; const next = {downs[1]}; {f"console.log('{C.lower()}{'D' if n >= 0 else 'd'}ownGroup', start.outerHTML,{downs[1]} ? {downs[1]}.outerHTML : 'NO_E');" if DEBUG else ""} return next === null ? (() => start) : next }};
export const {C.lower()}{'R' if n >= 0 else 'r'}ightGroup = (e) => {{ const start = {nexts[0]}; const next = {nexts[1]};  {f"console.log('{C.lower()}{'R' if n >= 0 else 'r'}ightGroup', start.outerHTML,{nexts[1]}? {nexts[1]}.outerHTML : 'NO_E');" if DEBUG else ""} return next === null ? (() => start) : next }};
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
instance pathWalker{C}DownGroup :: PathWalker a r => PathWalker (Path.{C}DownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    {DB("DownGroup")}
    p <- runEffectFn1 {C.lower()}{"D" if n >= 0 else "d"}ownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance pathWalker{C}RightGroup :: PathWalker a r => PathWalker (Path.{C}RightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    {DB("RightGroup")}
    p <- runEffectFn1 {C.lower()}{"R" if n >= 0 else "r"}ightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance pathWalker{C}ContGroupWithMarkers :: (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.{C}ContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    {DB("ContGroupWithMarkers")}
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance pathWalker{C}TwoContGroups ::(PathWalker a r, PathWalker b r) => PathWalker (Path.{C}TwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    {DB("TwoContGroups")}
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance pathWalker{C}TwoContGroupsWithMarkers :: (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.{C}TwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    {DB("TwoContGroupsWithMarkers")}
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
"""
    return T


# def genI(n, d):
#     C = None
#     if n < 0:
#         C = ''
#     else:
#       C = "{0:b}".format(d)
#       C = ("0" * (n + 1 - len(C))) + C
#       C = C.replace("0", "X").replace("1", "Y")
#     T = f"""-- @inline export pathWalker{C}DownGroup(..).walk always
# -- @inline export pathWalker{C}RightGroup(..).walk always
# -- @inline export pathWalker{C}ContGroupWithMarkers(..).walk always
# -- @inline export pathWalker{C}TwoContGroups(..).walk always
# -- @inline export pathWalker{C}TwoContGroupsWithMarkers(..).walk always
# """
#     return T

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
    oprint("""instance scrunchMarkerGroup :: Scrunch (MarkerGroup a) (MarkerGroup a)
instance scrunchContGroupWithMarkers :: (Scrunch b c) => Scrunch (ContGroupWithMarkers a b) (ContGroupWithMarkers a c)
instance scrunchTwoContGroups :: (Scrunch a c, Scrunch b d) => Scrunch (TwoContGroups a b) (TwoContGroups c d)
instance scrunchTwoContGroupsWithMarkers :: (Scrunch a c, Scrunch b d) => Scrunch (TwoContGroupsWithMarkers z a b) (TwoContGroupsWithMarkers z c d)

""")
    for y in range(2 << (R-1)):
        oprint(genT(R-1, y))
#     INLINES = []
#     def iprint(z):
#         INLINES.append(z)
#     iprint(genI(-1, -1))
#     for x in range(R):
#         for y in range(2 << x):
#             iprint(genI(x, y))
#     ILL = '\n'.join(INLINES)
#     INLINES = """-- @inline export processInstructionsNil.processInstructions always
# -- @inline export processInstructionsCons(..).processInstructions always
# -- @inline export pathWalkerMarkerGroup(..).walk always
# {ILL}
# """
    #####
    qprint(f"""module Deku.PathWalker where

import Prelude
{"import Debug(spy)" if DEBUG else ""}
import Control.Monad.ST.Class (liftST)
import Data.Array.ST as STArray
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, Attribute', unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), DekuOutcome(..), Nut(..), PSR(..), Tag(..), handleAtts)
import Deku.Interpret (attributeBeaconFullRangeParentProto, fromDekuBeacon, fromDekuElement, fromDekuText, toDekuElement)
import Deku.Path as Path
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn4, EffectFn5, mkEffectFn4, mkEffectFn5, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
import FRP.Poll (Poll)
import Foreign.Object.ST as STObject
import Prim.Row as R
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))
import Web.DOM (Element, Text)
import Web.DOM.ChildNode (remove)
import Web.DOM.Comment as Comment
import Web.DOM.Node as Node
import Web.DOM.Element as Element
import Web.DOM.Node (replaceChild)
import Deku.UnsafeDOM (insertBefore)
import Web.DOM.Text as Text

data MElement

foreign import mEltElt :: MElement -> Element
foreign import mEltify :: Node.Node -> MElement
foreign import mEltParent :: MElement -> Element
foreign import returnReplacementNoIndex :: EffectFn2 String  MElement Text
foreign import returnReplacement :: EffectFn2 Int  MElement Node.Node
foreign import returnReplacementIndex :: EffectFn2 String  MElement Int
type InstructionSignature i = EffectFn4 String i DOMInterpret MElement Unit
newtype InstructionDelegate = InstructionDelegate {{
  processPollString :: InstructionSignature (Poll String),
  processAttribute :: InstructionSignature (Poll Attribute'),
  processNut :: InstructionSignature Nut
}}

class PathWalker :: Path.Path -> Row Type -> Constraint
class PathWalker p r | p -> r where
  walk :: EffectFn5 InstructionDelegate (Proxy p) {{ | r }} DOMInterpret MElement Unit

class ProcessInstruction :: Symbol -> Type -> Constraint
class ProcessInstruction s i where
  processInstruction :: EffectFn5 InstructionDelegate (Proxy s) i DOMInterpret MElement Unit

class ProcessInstructions :: Row Type -> RL.RowList Symbol -> Constraint
class ProcessInstructions r rl | rl -> r where
  processInstructions :: EffectFn5 InstructionDelegate (Proxy rl) {{ | r }} DOMInterpret MElement Unit

instance processInstructionsNil :: ProcessInstructions r RL.Nil where
  processInstructions = mkEffectFn5 \_ _ _ _ _ -> pure unit

instance pathWalkerMarkerGroup :: (ProcessInstructions r a) => PathWalker (Path.MarkerGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    {'let _ = spy "MarkerGroup" r' if DEBUG else ''}
    runEffectFn5 processInstructions instr (Proxy :: _ a) r di e

instance processInstructionsCons :: (IsSymbol k, R.Cons k v r' r, ProcessInstruction k v, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k k c) where
  processInstructions = mkEffectFn5 \instr _ r di e -> do
      runEffectFn5 processInstruction instr (Proxy :: _ k) (get (Proxy :: _ k) r) di e
      runEffectFn5 processInstructions instr (Proxy :: _ c) r di e

processAttPursx :: InstructionSignature (Poll Attribute')
processAttPursx = mkEffectFn4 \\_ att di e -> do
    obj <- liftST STObject.new
    star <- liftST $ STArray.new
    handleAtts di obj (toDekuElement (mEltElt e)) star
      [  att ]

instance processInstructionPollAtt :: IsSymbol k => ProcessInstruction k (Poll (Attribute e)) where
  processInstruction = mkEffectFn5 \\(InstructionDelegate {{ processAttribute }}) k att di e -> do
    runEffectFn4 processAttribute (reflectSymbol k) (map unsafeUnAttribute att) di e

instance processInstructionPollString :: IsSymbol k => ProcessInstruction k (Poll String) where
  processInstruction = mkEffectFn5 \\(InstructionDelegate {{ processPollString }}) k pstring di e -> do
    runEffectFn4 processPollString (reflectSymbol k) pstring di e

processNutPursx :: EffectFn2 String  MElement Text ->  InstructionSignature Nut
processNutPursx splitter = mkEffectFn4 \\k (Nut nut) di@(DOMInterpret {{ makeElement }}) e -> do
    {'let _ = spy ("PINut") e' if DEBUG else ''}
    fauxPar <- runEffectFn2 makeElement Nothing (Tag "template")
    let par = mEltParent e
    o <- runEffectFn2 nut (PSR {{ unsubs: [], parent: fauxPar, beacon: Nothing, fromPortal: false }}) di
    t <- runEffectFn2 splitter k e
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

instance processInstructionNut :: IsSymbol k => ProcessInstruction k Nut where
  processInstruction = mkEffectFn5 \\(InstructionDelegate {{ processNut }}) k nut di e -> do
    runEffectFn4 processNut (reflectSymbol k) nut di e
""")
    jprint(genJ(-1, -1))
    qprint(genJJ(-1, -1))
    for x in range(R):
        qprint(f"---- level {x}")
        for y in range(2 << x):
            jprint(genJ(x, y))
            qprint(genJJ(x, y))
    jprint(f'''
export const mEltElt = e => e;
export const mEltParent = x => typeof x === 'function' ? x() : x.parentNode;
export const mEltify = e => e;
export const returnReplacementNoIndex = (s, e) => {{
  {'console.log("returnReplacementNoIndex", e ? e.outerHTML: `NO_E `+p.outerHTML);' if DEBUG else ''}
  // Get the previous sibling (text node) of the element
  let targetString = "~" + s + "~";
  let iterNode = typeof e !== 'function' ? e.previousSibling : e().lastChild;
  {'console.log("returnReplacementNoIndexPREV", iterNode, iterNode.textContent);' if DEBUG else ''}
  while (iterNode) {{
    if (iterNode.nodeType === 8) {{
      // 8 is the nodeType for a Comment node
      let index = iterNode.textContent.indexOf(targetString);

      if (index !== -1) {{
        return iterNode;
      }}
    }}
    iterNode = iterNode.previousSibling;
  }}

  throw new Error(
    "Programming error: previous node not a text node or target string not found: " +
      s
  );
}};

export const returnReplacement = (i, e) => {{
  {'console.log("returnReplacement", e ? e.outerHTML: `NO_E `+p.outerHTML);' if DEBUG else ''}
  // Get the previous sibling (text node) of the element
  let iterNode = typeof e !== 'function' ? e.previousSibling : e().lastChild;
  let ii = 0;
  while (ii < i) {{
    ii++;
    iterNode = iterNode.previousSibling;
  }}
  return iterNode;
}};

export const returnReplacementIndex = (s, e) => {{
  {'console.log("returnReplacement", e ? e.outerHTML: `NO_E `+p.outerHTML);' if DEBUG else ''}
  // Get the previous sibling (text node) of the element
  let targetString = "~" + s + "~";
  let iterNode = typeof e !== 'function' ? e.previousSibling : e().lastChild;
  let i = 0;
  while (iterNode) {{
    {'console.log("returnReplacement", iterNode, iterNode.textContent);' if DEBUG else ''}
    if (iterNode.nodeType === 8) {{  // 8 is the nodeType for a Comment node
      let index = iterNode.textContent.indexOf(targetString);
      if (index !== -1) {{
        return i;
      }}
    }}
    i++;
    iterNode = iterNode.previousSibling;
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

        