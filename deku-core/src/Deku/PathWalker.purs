module Deku.PathWalker where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Array.ST as STArray
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, Attribute', unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), DekuOutcome(..), Nut(..), PSR(..), Tag(..), handleAtts)
import Deku.Interpret (attributeBeaconFullRangeParentProto, fromDekuBeacon, fromDekuElement, fromDekuText, toDekuElement)
import Deku.Path as Path
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, mkEffectFn3, mkEffectFn4, mkEffectFn5, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
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

foreign import processStringImpl :: EffectFn3 String String MElement Unit
foreign import mEltElt :: MElement -> Element
foreign import mEltParent :: MElement -> Element
foreign import splitTextAndReturnReplacement :: EffectFn2 String  MElement Text

type InstructionSignature i = EffectFn4 String i DOMInterpret MElement Unit
newtype InstructionDelegate = InstructionDelegate {
  processString :: InstructionSignature String,
  processAttribute :: InstructionSignature (Poll Attribute'),
  processNut :: InstructionSignature Nut
}

class PathWalker :: Path.Path -> Row Type -> Constraint
class PathWalker p r | p -> r where
  walk :: EffectFn5 InstructionDelegate (Proxy p) { | r } DOMInterpret MElement Unit

class ProcessInstruction :: Symbol -> Type -> Constraint
class ProcessInstruction s i where
  processInstruction :: EffectFn5 InstructionDelegate (Proxy s) i DOMInterpret MElement Unit

class ProcessInstructions :: Row Type -> RL.RowList Symbol -> Constraint
class ProcessInstructions r rl | rl -> r where
  processInstructions :: EffectFn5 InstructionDelegate (Proxy rl) { | r } DOMInterpret MElement Unit

instance ProcessInstructions r RL.Nil where
  processInstructions = mkEffectFn5 \_ _ _ _ _ -> pure unit

instance (ProcessInstructions r a) => PathWalker (Path.MarkerGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ a) r di e

instance (IsSymbol k, R.Cons k v r' r, ProcessInstruction k v, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k k c) where
  processInstructions = mkEffectFn5 \instr _ r di e -> do
      runEffectFn5 processInstruction instr (Proxy :: _ k) (get (Proxy :: _ k) r) di e
      runEffectFn5 processInstructions instr (Proxy :: _ c) r di e

instance IsSymbol k => ProcessInstruction k String where
  processInstruction = mkEffectFn5 \(InstructionDelegate { processString }) k s di e -> do
    
    runEffectFn4 processString (reflectSymbol k) s di e

processAttPursx :: InstructionSignature (Poll Attribute')
processAttPursx = mkEffectFn4 \_ att di e -> do
    obj <- liftST STObject.new
    star <- liftST $ STArray.new
    runEffectFn5 handleAtts di obj (toDekuElement (mEltElt e)) star
      [  att ]

instance IsSymbol k => ProcessInstruction k (Poll (Attribute e)) where
  processInstruction = mkEffectFn5 \(InstructionDelegate { processAttribute }) k att di e -> do
    runEffectFn4 processAttribute (reflectSymbol k) (map unsafeUnAttribute att) di e

processNutPursx :: InstructionSignature Nut
processNutPursx = mkEffectFn4 \k (Nut nut) di@(DOMInterpret { makeElement }) e -> do
    
    fauxPar <- runEffectFn2 makeElement Nothing (Tag "template")
    let par = mEltParent e
    o <- runEffectFn2 nut (PSR { unsubs: [], parent: fauxPar, beacon: Nothing, fromPortal: false }) di
    t <- runEffectFn2 splitTextAndReturnReplacement k e
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

instance IsSymbol k => ProcessInstruction k Nut where
  processInstruction = mkEffectFn5 \(InstructionDelegate { processNut }) k nut di e -> do
    runEffectFn4 processNut (reflectSymbol k) nut di e

foreign import downGroup :: EffectFn1 MElement MElement
foreign import rightGroup :: EffectFn1 MElement MElement

---- level 0
foreign import xDownGroup :: EffectFn1 MElement MElement
foreign import xRightGroup :: EffectFn1 MElement MElement

foreign import yDownGroup :: EffectFn1 MElement MElement
foreign import yRightGroup :: EffectFn1 MElement MElement

---- level 1
foreign import xxDownGroup :: EffectFn1 MElement MElement
foreign import xxRightGroup :: EffectFn1 MElement MElement

foreign import xyDownGroup :: EffectFn1 MElement MElement
foreign import xyRightGroup :: EffectFn1 MElement MElement

foreign import yxDownGroup :: EffectFn1 MElement MElement
foreign import yxRightGroup :: EffectFn1 MElement MElement

foreign import yyDownGroup :: EffectFn1 MElement MElement
foreign import yyRightGroup :: EffectFn1 MElement MElement

---- level 2
foreign import xxxDownGroup :: EffectFn1 MElement MElement
foreign import xxxRightGroup :: EffectFn1 MElement MElement

foreign import xxyDownGroup :: EffectFn1 MElement MElement
foreign import xxyRightGroup :: EffectFn1 MElement MElement

foreign import xyxDownGroup :: EffectFn1 MElement MElement
foreign import xyxRightGroup :: EffectFn1 MElement MElement

foreign import xyyDownGroup :: EffectFn1 MElement MElement
foreign import xyyRightGroup :: EffectFn1 MElement MElement

foreign import yxxDownGroup :: EffectFn1 MElement MElement
foreign import yxxRightGroup :: EffectFn1 MElement MElement

foreign import yxyDownGroup :: EffectFn1 MElement MElement
foreign import yxyRightGroup :: EffectFn1 MElement MElement

foreign import yyxDownGroup :: EffectFn1 MElement MElement
foreign import yyxRightGroup :: EffectFn1 MElement MElement

foreign import yyyDownGroup :: EffectFn1 MElement MElement
foreign import yyyRightGroup :: EffectFn1 MElement MElement

---- level 3
foreign import xxxxDownGroup :: EffectFn1 MElement MElement
foreign import xxxxRightGroup :: EffectFn1 MElement MElement

foreign import xxxyDownGroup :: EffectFn1 MElement MElement
foreign import xxxyRightGroup :: EffectFn1 MElement MElement

foreign import xxyxDownGroup :: EffectFn1 MElement MElement
foreign import xxyxRightGroup :: EffectFn1 MElement MElement

foreign import xxyyDownGroup :: EffectFn1 MElement MElement
foreign import xxyyRightGroup :: EffectFn1 MElement MElement

foreign import xyxxDownGroup :: EffectFn1 MElement MElement
foreign import xyxxRightGroup :: EffectFn1 MElement MElement

foreign import xyxyDownGroup :: EffectFn1 MElement MElement
foreign import xyxyRightGroup :: EffectFn1 MElement MElement

foreign import xyyxDownGroup :: EffectFn1 MElement MElement
foreign import xyyxRightGroup :: EffectFn1 MElement MElement

foreign import xyyyDownGroup :: EffectFn1 MElement MElement
foreign import xyyyRightGroup :: EffectFn1 MElement MElement

foreign import yxxxDownGroup :: EffectFn1 MElement MElement
foreign import yxxxRightGroup :: EffectFn1 MElement MElement

foreign import yxxyDownGroup :: EffectFn1 MElement MElement
foreign import yxxyRightGroup :: EffectFn1 MElement MElement

foreign import yxyxDownGroup :: EffectFn1 MElement MElement
foreign import yxyxRightGroup :: EffectFn1 MElement MElement

foreign import yxyyDownGroup :: EffectFn1 MElement MElement
foreign import yxyyRightGroup :: EffectFn1 MElement MElement

foreign import yyxxDownGroup :: EffectFn1 MElement MElement
foreign import yyxxRightGroup :: EffectFn1 MElement MElement

foreign import yyxyDownGroup :: EffectFn1 MElement MElement
foreign import yyxyRightGroup :: EffectFn1 MElement MElement

foreign import yyyxDownGroup :: EffectFn1 MElement MElement
foreign import yyyxRightGroup :: EffectFn1 MElement MElement

foreign import yyyyDownGroup :: EffectFn1 MElement MElement
foreign import yyyyRightGroup :: EffectFn1 MElement MElement

---- level 4
foreign import xxxxxDownGroup :: EffectFn1 MElement MElement
foreign import xxxxxRightGroup :: EffectFn1 MElement MElement

foreign import xxxxyDownGroup :: EffectFn1 MElement MElement
foreign import xxxxyRightGroup :: EffectFn1 MElement MElement

foreign import xxxyxDownGroup :: EffectFn1 MElement MElement
foreign import xxxyxRightGroup :: EffectFn1 MElement MElement

foreign import xxxyyDownGroup :: EffectFn1 MElement MElement
foreign import xxxyyRightGroup :: EffectFn1 MElement MElement

foreign import xxyxxDownGroup :: EffectFn1 MElement MElement
foreign import xxyxxRightGroup :: EffectFn1 MElement MElement

foreign import xxyxyDownGroup :: EffectFn1 MElement MElement
foreign import xxyxyRightGroup :: EffectFn1 MElement MElement

foreign import xxyyxDownGroup :: EffectFn1 MElement MElement
foreign import xxyyxRightGroup :: EffectFn1 MElement MElement

foreign import xxyyyDownGroup :: EffectFn1 MElement MElement
foreign import xxyyyRightGroup :: EffectFn1 MElement MElement

foreign import xyxxxDownGroup :: EffectFn1 MElement MElement
foreign import xyxxxRightGroup :: EffectFn1 MElement MElement

foreign import xyxxyDownGroup :: EffectFn1 MElement MElement
foreign import xyxxyRightGroup :: EffectFn1 MElement MElement

foreign import xyxyxDownGroup :: EffectFn1 MElement MElement
foreign import xyxyxRightGroup :: EffectFn1 MElement MElement

foreign import xyxyyDownGroup :: EffectFn1 MElement MElement
foreign import xyxyyRightGroup :: EffectFn1 MElement MElement

foreign import xyyxxDownGroup :: EffectFn1 MElement MElement
foreign import xyyxxRightGroup :: EffectFn1 MElement MElement

foreign import xyyxyDownGroup :: EffectFn1 MElement MElement
foreign import xyyxyRightGroup :: EffectFn1 MElement MElement

foreign import xyyyxDownGroup :: EffectFn1 MElement MElement
foreign import xyyyxRightGroup :: EffectFn1 MElement MElement

foreign import xyyyyDownGroup :: EffectFn1 MElement MElement
foreign import xyyyyRightGroup :: EffectFn1 MElement MElement

foreign import yxxxxDownGroup :: EffectFn1 MElement MElement
foreign import yxxxxRightGroup :: EffectFn1 MElement MElement

foreign import yxxxyDownGroup :: EffectFn1 MElement MElement
foreign import yxxxyRightGroup :: EffectFn1 MElement MElement

foreign import yxxyxDownGroup :: EffectFn1 MElement MElement
foreign import yxxyxRightGroup :: EffectFn1 MElement MElement

foreign import yxxyyDownGroup :: EffectFn1 MElement MElement
foreign import yxxyyRightGroup :: EffectFn1 MElement MElement

foreign import yxyxxDownGroup :: EffectFn1 MElement MElement
foreign import yxyxxRightGroup :: EffectFn1 MElement MElement

foreign import yxyxyDownGroup :: EffectFn1 MElement MElement
foreign import yxyxyRightGroup :: EffectFn1 MElement MElement

foreign import yxyyxDownGroup :: EffectFn1 MElement MElement
foreign import yxyyxRightGroup :: EffectFn1 MElement MElement

foreign import yxyyyDownGroup :: EffectFn1 MElement MElement
foreign import yxyyyRightGroup :: EffectFn1 MElement MElement

foreign import yyxxxDownGroup :: EffectFn1 MElement MElement
foreign import yyxxxRightGroup :: EffectFn1 MElement MElement

foreign import yyxxyDownGroup :: EffectFn1 MElement MElement
foreign import yyxxyRightGroup :: EffectFn1 MElement MElement

foreign import yyxyxDownGroup :: EffectFn1 MElement MElement
foreign import yyxyxRightGroup :: EffectFn1 MElement MElement

foreign import yyxyyDownGroup :: EffectFn1 MElement MElement
foreign import yyxyyRightGroup :: EffectFn1 MElement MElement

foreign import yyyxxDownGroup :: EffectFn1 MElement MElement
foreign import yyyxxRightGroup :: EffectFn1 MElement MElement

foreign import yyyxyDownGroup :: EffectFn1 MElement MElement
foreign import yyyxyRightGroup :: EffectFn1 MElement MElement

foreign import yyyyxDownGroup :: EffectFn1 MElement MElement
foreign import yyyyxRightGroup :: EffectFn1 MElement MElement

foreign import yyyyyDownGroup :: EffectFn1 MElement MElement
foreign import yyyyyRightGroup :: EffectFn1 MElement MElement

---- level 5
foreign import xxxxxxDownGroup :: EffectFn1 MElement MElement
foreign import xxxxxxRightGroup :: EffectFn1 MElement MElement

foreign import xxxxxyDownGroup :: EffectFn1 MElement MElement
foreign import xxxxxyRightGroup :: EffectFn1 MElement MElement

foreign import xxxxyxDownGroup :: EffectFn1 MElement MElement
foreign import xxxxyxRightGroup :: EffectFn1 MElement MElement

foreign import xxxxyyDownGroup :: EffectFn1 MElement MElement
foreign import xxxxyyRightGroup :: EffectFn1 MElement MElement

foreign import xxxyxxDownGroup :: EffectFn1 MElement MElement
foreign import xxxyxxRightGroup :: EffectFn1 MElement MElement

foreign import xxxyxyDownGroup :: EffectFn1 MElement MElement
foreign import xxxyxyRightGroup :: EffectFn1 MElement MElement

foreign import xxxyyxDownGroup :: EffectFn1 MElement MElement
foreign import xxxyyxRightGroup :: EffectFn1 MElement MElement

foreign import xxxyyyDownGroup :: EffectFn1 MElement MElement
foreign import xxxyyyRightGroup :: EffectFn1 MElement MElement

foreign import xxyxxxDownGroup :: EffectFn1 MElement MElement
foreign import xxyxxxRightGroup :: EffectFn1 MElement MElement

foreign import xxyxxyDownGroup :: EffectFn1 MElement MElement
foreign import xxyxxyRightGroup :: EffectFn1 MElement MElement

foreign import xxyxyxDownGroup :: EffectFn1 MElement MElement
foreign import xxyxyxRightGroup :: EffectFn1 MElement MElement

foreign import xxyxyyDownGroup :: EffectFn1 MElement MElement
foreign import xxyxyyRightGroup :: EffectFn1 MElement MElement

foreign import xxyyxxDownGroup :: EffectFn1 MElement MElement
foreign import xxyyxxRightGroup :: EffectFn1 MElement MElement

foreign import xxyyxyDownGroup :: EffectFn1 MElement MElement
foreign import xxyyxyRightGroup :: EffectFn1 MElement MElement

foreign import xxyyyxDownGroup :: EffectFn1 MElement MElement
foreign import xxyyyxRightGroup :: EffectFn1 MElement MElement

foreign import xxyyyyDownGroup :: EffectFn1 MElement MElement
foreign import xxyyyyRightGroup :: EffectFn1 MElement MElement

foreign import xyxxxxDownGroup :: EffectFn1 MElement MElement
foreign import xyxxxxRightGroup :: EffectFn1 MElement MElement

foreign import xyxxxyDownGroup :: EffectFn1 MElement MElement
foreign import xyxxxyRightGroup :: EffectFn1 MElement MElement

foreign import xyxxyxDownGroup :: EffectFn1 MElement MElement
foreign import xyxxyxRightGroup :: EffectFn1 MElement MElement

foreign import xyxxyyDownGroup :: EffectFn1 MElement MElement
foreign import xyxxyyRightGroup :: EffectFn1 MElement MElement

foreign import xyxyxxDownGroup :: EffectFn1 MElement MElement
foreign import xyxyxxRightGroup :: EffectFn1 MElement MElement

foreign import xyxyxyDownGroup :: EffectFn1 MElement MElement
foreign import xyxyxyRightGroup :: EffectFn1 MElement MElement

foreign import xyxyyxDownGroup :: EffectFn1 MElement MElement
foreign import xyxyyxRightGroup :: EffectFn1 MElement MElement

foreign import xyxyyyDownGroup :: EffectFn1 MElement MElement
foreign import xyxyyyRightGroup :: EffectFn1 MElement MElement

foreign import xyyxxxDownGroup :: EffectFn1 MElement MElement
foreign import xyyxxxRightGroup :: EffectFn1 MElement MElement

foreign import xyyxxyDownGroup :: EffectFn1 MElement MElement
foreign import xyyxxyRightGroup :: EffectFn1 MElement MElement

foreign import xyyxyxDownGroup :: EffectFn1 MElement MElement
foreign import xyyxyxRightGroup :: EffectFn1 MElement MElement

foreign import xyyxyyDownGroup :: EffectFn1 MElement MElement
foreign import xyyxyyRightGroup :: EffectFn1 MElement MElement

foreign import xyyyxxDownGroup :: EffectFn1 MElement MElement
foreign import xyyyxxRightGroup :: EffectFn1 MElement MElement

foreign import xyyyxyDownGroup :: EffectFn1 MElement MElement
foreign import xyyyxyRightGroup :: EffectFn1 MElement MElement

foreign import xyyyyxDownGroup :: EffectFn1 MElement MElement
foreign import xyyyyxRightGroup :: EffectFn1 MElement MElement

foreign import xyyyyyDownGroup :: EffectFn1 MElement MElement
foreign import xyyyyyRightGroup :: EffectFn1 MElement MElement

foreign import yxxxxxDownGroup :: EffectFn1 MElement MElement
foreign import yxxxxxRightGroup :: EffectFn1 MElement MElement

foreign import yxxxxyDownGroup :: EffectFn1 MElement MElement
foreign import yxxxxyRightGroup :: EffectFn1 MElement MElement

foreign import yxxxyxDownGroup :: EffectFn1 MElement MElement
foreign import yxxxyxRightGroup :: EffectFn1 MElement MElement

foreign import yxxxyyDownGroup :: EffectFn1 MElement MElement
foreign import yxxxyyRightGroup :: EffectFn1 MElement MElement

foreign import yxxyxxDownGroup :: EffectFn1 MElement MElement
foreign import yxxyxxRightGroup :: EffectFn1 MElement MElement

foreign import yxxyxyDownGroup :: EffectFn1 MElement MElement
foreign import yxxyxyRightGroup :: EffectFn1 MElement MElement

foreign import yxxyyxDownGroup :: EffectFn1 MElement MElement
foreign import yxxyyxRightGroup :: EffectFn1 MElement MElement

foreign import yxxyyyDownGroup :: EffectFn1 MElement MElement
foreign import yxxyyyRightGroup :: EffectFn1 MElement MElement

foreign import yxyxxxDownGroup :: EffectFn1 MElement MElement
foreign import yxyxxxRightGroup :: EffectFn1 MElement MElement

foreign import yxyxxyDownGroup :: EffectFn1 MElement MElement
foreign import yxyxxyRightGroup :: EffectFn1 MElement MElement

foreign import yxyxyxDownGroup :: EffectFn1 MElement MElement
foreign import yxyxyxRightGroup :: EffectFn1 MElement MElement

foreign import yxyxyyDownGroup :: EffectFn1 MElement MElement
foreign import yxyxyyRightGroup :: EffectFn1 MElement MElement

foreign import yxyyxxDownGroup :: EffectFn1 MElement MElement
foreign import yxyyxxRightGroup :: EffectFn1 MElement MElement

foreign import yxyyxyDownGroup :: EffectFn1 MElement MElement
foreign import yxyyxyRightGroup :: EffectFn1 MElement MElement

foreign import yxyyyxDownGroup :: EffectFn1 MElement MElement
foreign import yxyyyxRightGroup :: EffectFn1 MElement MElement

foreign import yxyyyyDownGroup :: EffectFn1 MElement MElement
foreign import yxyyyyRightGroup :: EffectFn1 MElement MElement

foreign import yyxxxxDownGroup :: EffectFn1 MElement MElement
foreign import yyxxxxRightGroup :: EffectFn1 MElement MElement

foreign import yyxxxyDownGroup :: EffectFn1 MElement MElement
foreign import yyxxxyRightGroup :: EffectFn1 MElement MElement

foreign import yyxxyxDownGroup :: EffectFn1 MElement MElement
foreign import yyxxyxRightGroup :: EffectFn1 MElement MElement

foreign import yyxxyyDownGroup :: EffectFn1 MElement MElement
foreign import yyxxyyRightGroup :: EffectFn1 MElement MElement

foreign import yyxyxxDownGroup :: EffectFn1 MElement MElement
foreign import yyxyxxRightGroup :: EffectFn1 MElement MElement

foreign import yyxyxyDownGroup :: EffectFn1 MElement MElement
foreign import yyxyxyRightGroup :: EffectFn1 MElement MElement

foreign import yyxyyxDownGroup :: EffectFn1 MElement MElement
foreign import yyxyyxRightGroup :: EffectFn1 MElement MElement

foreign import yyxyyyDownGroup :: EffectFn1 MElement MElement
foreign import yyxyyyRightGroup :: EffectFn1 MElement MElement

foreign import yyyxxxDownGroup :: EffectFn1 MElement MElement
foreign import yyyxxxRightGroup :: EffectFn1 MElement MElement

foreign import yyyxxyDownGroup :: EffectFn1 MElement MElement
foreign import yyyxxyRightGroup :: EffectFn1 MElement MElement

foreign import yyyxyxDownGroup :: EffectFn1 MElement MElement
foreign import yyyxyxRightGroup :: EffectFn1 MElement MElement

foreign import yyyxyyDownGroup :: EffectFn1 MElement MElement
foreign import yyyxyyRightGroup :: EffectFn1 MElement MElement

foreign import yyyyxxDownGroup :: EffectFn1 MElement MElement
foreign import yyyyxxRightGroup :: EffectFn1 MElement MElement

foreign import yyyyxyDownGroup :: EffectFn1 MElement MElement
foreign import yyyyxyRightGroup :: EffectFn1 MElement MElement

foreign import yyyyyxDownGroup :: EffectFn1 MElement MElement
foreign import yyyyyxRightGroup :: EffectFn1 MElement MElement

foreign import yyyyyyDownGroup :: EffectFn1 MElement MElement
foreign import yyyyyyRightGroup :: EffectFn1 MElement MElement

----------- new section
---
instance PathWalker a r => PathWalker (Path.DownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 downGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.RightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 rightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.ContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.TwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.TwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---- level 0
---
instance PathWalker a r => PathWalker (Path.XDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---- level 1
---
instance PathWalker a r => PathWalker (Path.XXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---- level 2
---
instance PathWalker a r => PathWalker (Path.XXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---- level 3
---
instance PathWalker a r => PathWalker (Path.XXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---- level 4
---
instance PathWalker a r => PathWalker (Path.XXXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---- level 5
---
instance PathWalker a r => PathWalker (Path.XXXXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxxyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xxyyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyxyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 xyyyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxxyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yxyyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyxyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyxyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYXXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyxxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYXXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyxxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYXXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYXYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyxyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYXYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyxyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYXYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYYXDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyyxDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYYXRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyyxRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYYXTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYYYDownGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyyyDownGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYYYRightGroup a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    p <- runEffectFn1 yyyyyyRightGroup e
    runEffectFn5 walk instr (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYYYTwoContGroups a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn5 \instr _ r di e -> do
    
    runEffectFn5 processInstructions instr (Proxy :: _ zz) r di e
    runEffectFn5 walk instr (Proxy :: _ a) r di e
    runEffectFn5 walk instr (Proxy :: _ b) r di e
