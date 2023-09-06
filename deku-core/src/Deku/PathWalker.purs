module Deku.PathWalker where

import Prelude
import Debug(spy)
import Control.Monad.ST.Class (liftST)
import Data.Array.ST as STArray
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute)
import Deku.Core (DOMInterpret(..), DekuOutcome(..), Nut(..), PSR(..), Tag(..), handleAtts)
import Deku.Interpret (attributeBeaconFullRangeParentProto, fromDekuBeacon, fromDekuElement, fromDekuText, toDekuElement)
import Deku.Path as Path
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, mkEffectFn3, mkEffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
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

foreign import processString :: EffectFn2 String MElement Unit
foreign import mEltElt :: MElement -> Element
foreign import mEltParent :: MElement -> Element
foreign import splitTextAndReturnReplacement :: EffectFn2 String  MElement Text

class PathWalker :: Path.Path -> Row Type -> Constraint
class PathWalker p r | p -> r where
  walk :: EffectFn4 (Proxy p) { | r } DOMInterpret MElement Unit

class ProcessInstruction :: Symbol -> Type -> Constraint
class ProcessInstruction s i where
  processInstruction :: EffectFn4 (Proxy s) i DOMInterpret MElement Unit

class ProcessInstructions :: Row Type -> RL.RowList Symbol -> Constraint
class ProcessInstructions r rl | rl -> r where
  processInstructions :: EffectFn4 (Proxy rl) { | r } DOMInterpret MElement Unit

instance ProcessInstructions r RL.Nil where
  processInstructions = mkEffectFn4 \_ _ _ _ -> pure unit

instance (ProcessInstructions r a) => PathWalker (Path.MarkerGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "MarkerGroup" r
    runEffectFn4 processInstructions (Proxy :: _ a) r di e

instance (IsSymbol k, R.Cons k v r' r, ProcessInstruction k v, ProcessInstructions r c) => ProcessInstructions r (RL.Cons k k c) where
  processInstructions = mkEffectFn4 \_ r di e -> runEffectFn4 processInstruction (Proxy :: _ k) (get (Proxy :: _ k) r) di e

instance ProcessInstruction k String where
  processInstruction = mkEffectFn4 \_ s _ e -> do
    let _ = spy ("PIString@") {s,e}
    runEffectFn2 processString s e

instance ProcessInstruction k (Poll (Attribute e)) where
  processInstruction = mkEffectFn4 \_ att di e -> do
    let _ = spy ("PIAtt@") e
    obj <- liftST STObject.new
    star <- liftST $ STArray.new
    handleAtts di obj (toDekuElement (mEltElt e)) star
      [  att ]

instance IsSymbol k => ProcessInstruction k Nut where
  processInstruction = mkEffectFn4 \k (Nut nut) di@(DOMInterpret { makeElement }) e -> do
    let _ = spy ("PINut") e
    fauxPar <- runEffectFn2 makeElement Nothing (Tag "template")
    let par = mEltParent e
    o <- runEffectFn2 nut (PSR { unsubs: [], parent: fauxPar, beacon: Nothing, fromPortal: false }) di
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
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "DownGroup" true
    p <- runEffectFn1 downGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.RightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "RightGroup" true
    p <- runEffectFn1 rightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.ContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "ContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.TwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "TwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.TwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "TwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---- level 0
---
instance PathWalker a r => PathWalker (Path.XDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XDownGroup" true
    p <- runEffectFn1 xDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XRightGroup" true
    p <- runEffectFn1 xRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YDownGroup" true
    p <- runEffectFn1 yDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YRightGroup" true
    p <- runEffectFn1 yRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---- level 1
---
instance PathWalker a r => PathWalker (Path.XXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXDownGroup" true
    p <- runEffectFn1 xxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXRightGroup" true
    p <- runEffectFn1 xxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYDownGroup" true
    p <- runEffectFn1 xyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYRightGroup" true
    p <- runEffectFn1 xyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXDownGroup" true
    p <- runEffectFn1 yxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXRightGroup" true
    p <- runEffectFn1 yxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYDownGroup" true
    p <- runEffectFn1 yyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYRightGroup" true
    p <- runEffectFn1 yyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---- level 2
---
instance PathWalker a r => PathWalker (Path.XXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXDownGroup" true
    p <- runEffectFn1 xxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXRightGroup" true
    p <- runEffectFn1 xxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYDownGroup" true
    p <- runEffectFn1 xxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYRightGroup" true
    p <- runEffectFn1 xxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXDownGroup" true
    p <- runEffectFn1 xyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXRightGroup" true
    p <- runEffectFn1 xyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYDownGroup" true
    p <- runEffectFn1 xyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYRightGroup" true
    p <- runEffectFn1 xyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXDownGroup" true
    p <- runEffectFn1 yxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXRightGroup" true
    p <- runEffectFn1 yxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYDownGroup" true
    p <- runEffectFn1 yxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYRightGroup" true
    p <- runEffectFn1 yxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXDownGroup" true
    p <- runEffectFn1 yyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXRightGroup" true
    p <- runEffectFn1 yyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYDownGroup" true
    p <- runEffectFn1 yyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYRightGroup" true
    p <- runEffectFn1 yyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---- level 3
---
instance PathWalker a r => PathWalker (Path.XXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXDownGroup" true
    p <- runEffectFn1 xxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXRightGroup" true
    p <- runEffectFn1 xxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYDownGroup" true
    p <- runEffectFn1 xxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYRightGroup" true
    p <- runEffectFn1 xxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXDownGroup" true
    p <- runEffectFn1 xxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXRightGroup" true
    p <- runEffectFn1 xxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYDownGroup" true
    p <- runEffectFn1 xxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYRightGroup" true
    p <- runEffectFn1 xxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXDownGroup" true
    p <- runEffectFn1 xyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXRightGroup" true
    p <- runEffectFn1 xyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYDownGroup" true
    p <- runEffectFn1 xyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYRightGroup" true
    p <- runEffectFn1 xyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXDownGroup" true
    p <- runEffectFn1 xyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXRightGroup" true
    p <- runEffectFn1 xyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYDownGroup" true
    p <- runEffectFn1 xyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYRightGroup" true
    p <- runEffectFn1 xyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXDownGroup" true
    p <- runEffectFn1 yxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXRightGroup" true
    p <- runEffectFn1 yxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYDownGroup" true
    p <- runEffectFn1 yxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYRightGroup" true
    p <- runEffectFn1 yxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXDownGroup" true
    p <- runEffectFn1 yxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXRightGroup" true
    p <- runEffectFn1 yxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYDownGroup" true
    p <- runEffectFn1 yxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYRightGroup" true
    p <- runEffectFn1 yxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXDownGroup" true
    p <- runEffectFn1 yyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXRightGroup" true
    p <- runEffectFn1 yyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYDownGroup" true
    p <- runEffectFn1 yyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYRightGroup" true
    p <- runEffectFn1 yyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXDownGroup" true
    p <- runEffectFn1 yyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXRightGroup" true
    p <- runEffectFn1 yyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYDownGroup" true
    p <- runEffectFn1 yyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYRightGroup" true
    p <- runEffectFn1 yyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---- level 4
---
instance PathWalker a r => PathWalker (Path.XXXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXDownGroup" true
    p <- runEffectFn1 xxxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXRightGroup" true
    p <- runEffectFn1 xxxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYDownGroup" true
    p <- runEffectFn1 xxxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYRightGroup" true
    p <- runEffectFn1 xxxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXDownGroup" true
    p <- runEffectFn1 xxxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXRightGroup" true
    p <- runEffectFn1 xxxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYDownGroup" true
    p <- runEffectFn1 xxxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYRightGroup" true
    p <- runEffectFn1 xxxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXDownGroup" true
    p <- runEffectFn1 xxyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXRightGroup" true
    p <- runEffectFn1 xxyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYDownGroup" true
    p <- runEffectFn1 xxyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYRightGroup" true
    p <- runEffectFn1 xxyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXDownGroup" true
    p <- runEffectFn1 xxyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXRightGroup" true
    p <- runEffectFn1 xxyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYDownGroup" true
    p <- runEffectFn1 xxyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYRightGroup" true
    p <- runEffectFn1 xxyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXDownGroup" true
    p <- runEffectFn1 xyxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXRightGroup" true
    p <- runEffectFn1 xyxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYDownGroup" true
    p <- runEffectFn1 xyxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYRightGroup" true
    p <- runEffectFn1 xyxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXDownGroup" true
    p <- runEffectFn1 xyxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXRightGroup" true
    p <- runEffectFn1 xyxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYDownGroup" true
    p <- runEffectFn1 xyxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYRightGroup" true
    p <- runEffectFn1 xyxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXDownGroup" true
    p <- runEffectFn1 xyyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXRightGroup" true
    p <- runEffectFn1 xyyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYDownGroup" true
    p <- runEffectFn1 xyyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYRightGroup" true
    p <- runEffectFn1 xyyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXDownGroup" true
    p <- runEffectFn1 xyyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXRightGroup" true
    p <- runEffectFn1 xyyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYDownGroup" true
    p <- runEffectFn1 xyyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYRightGroup" true
    p <- runEffectFn1 xyyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXDownGroup" true
    p <- runEffectFn1 yxxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXRightGroup" true
    p <- runEffectFn1 yxxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYDownGroup" true
    p <- runEffectFn1 yxxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYRightGroup" true
    p <- runEffectFn1 yxxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXDownGroup" true
    p <- runEffectFn1 yxxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXRightGroup" true
    p <- runEffectFn1 yxxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYDownGroup" true
    p <- runEffectFn1 yxxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYRightGroup" true
    p <- runEffectFn1 yxxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXDownGroup" true
    p <- runEffectFn1 yxyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXRightGroup" true
    p <- runEffectFn1 yxyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYDownGroup" true
    p <- runEffectFn1 yxyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYRightGroup" true
    p <- runEffectFn1 yxyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXDownGroup" true
    p <- runEffectFn1 yxyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXRightGroup" true
    p <- runEffectFn1 yxyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYDownGroup" true
    p <- runEffectFn1 yxyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYRightGroup" true
    p <- runEffectFn1 yxyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXDownGroup" true
    p <- runEffectFn1 yyxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXRightGroup" true
    p <- runEffectFn1 yyxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYDownGroup" true
    p <- runEffectFn1 yyxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYRightGroup" true
    p <- runEffectFn1 yyxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXDownGroup" true
    p <- runEffectFn1 yyxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXRightGroup" true
    p <- runEffectFn1 yyxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYDownGroup" true
    p <- runEffectFn1 yyxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYRightGroup" true
    p <- runEffectFn1 yyxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXDownGroup" true
    p <- runEffectFn1 yyyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXRightGroup" true
    p <- runEffectFn1 yyyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYDownGroup" true
    p <- runEffectFn1 yyyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYRightGroup" true
    p <- runEffectFn1 yyyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXDownGroup" true
    p <- runEffectFn1 yyyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXRightGroup" true
    p <- runEffectFn1 yyyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYDownGroup" true
    p <- runEffectFn1 yyyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYRightGroup" true
    p <- runEffectFn1 yyyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---- level 5
---
instance PathWalker a r => PathWalker (Path.XXXXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXXDownGroup" true
    p <- runEffectFn1 xxxxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXXRightGroup" true
    p <- runEffectFn1 xxxxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXYDownGroup" true
    p <- runEffectFn1 xxxxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXYRightGroup" true
    p <- runEffectFn1 xxxxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYXDownGroup" true
    p <- runEffectFn1 xxxxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYXRightGroup" true
    p <- runEffectFn1 xxxxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYYDownGroup" true
    p <- runEffectFn1 xxxxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYYRightGroup" true
    p <- runEffectFn1 xxxxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXXDownGroup" true
    p <- runEffectFn1 xxxyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXXRightGroup" true
    p <- runEffectFn1 xxxyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXYDownGroup" true
    p <- runEffectFn1 xxxyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXYRightGroup" true
    p <- runEffectFn1 xxxyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYXDownGroup" true
    p <- runEffectFn1 xxxyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYXRightGroup" true
    p <- runEffectFn1 xxxyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXXYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYYDownGroup" true
    p <- runEffectFn1 xxxyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXXYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYYRightGroup" true
    p <- runEffectFn1 xxxyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXXYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXXYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXXDownGroup" true
    p <- runEffectFn1 xxyxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXXRightGroup" true
    p <- runEffectFn1 xxyxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXYDownGroup" true
    p <- runEffectFn1 xxyxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXYRightGroup" true
    p <- runEffectFn1 xxyxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYXDownGroup" true
    p <- runEffectFn1 xxyxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYXRightGroup" true
    p <- runEffectFn1 xxyxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYYDownGroup" true
    p <- runEffectFn1 xxyxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYYRightGroup" true
    p <- runEffectFn1 xxyxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXXDownGroup" true
    p <- runEffectFn1 xxyyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXXRightGroup" true
    p <- runEffectFn1 xxyyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXYDownGroup" true
    p <- runEffectFn1 xxyyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXYRightGroup" true
    p <- runEffectFn1 xxyyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYXDownGroup" true
    p <- runEffectFn1 xxyyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYXRightGroup" true
    p <- runEffectFn1 xxyyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XXYYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYYDownGroup" true
    p <- runEffectFn1 xxyyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XXYYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYYRightGroup" true
    p <- runEffectFn1 xxyyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XXYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XXYYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XXYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XXYYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXXDownGroup" true
    p <- runEffectFn1 xyxxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXXRightGroup" true
    p <- runEffectFn1 xyxxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXYDownGroup" true
    p <- runEffectFn1 xyxxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXYRightGroup" true
    p <- runEffectFn1 xyxxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYXDownGroup" true
    p <- runEffectFn1 xyxxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYXRightGroup" true
    p <- runEffectFn1 xyxxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYYDownGroup" true
    p <- runEffectFn1 xyxxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYYRightGroup" true
    p <- runEffectFn1 xyxxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXXDownGroup" true
    p <- runEffectFn1 xyxyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXXRightGroup" true
    p <- runEffectFn1 xyxyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXYDownGroup" true
    p <- runEffectFn1 xyxyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXYRightGroup" true
    p <- runEffectFn1 xyxyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYXDownGroup" true
    p <- runEffectFn1 xyxyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYXRightGroup" true
    p <- runEffectFn1 xyxyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYXYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYYDownGroup" true
    p <- runEffectFn1 xyxyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYXYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYYRightGroup" true
    p <- runEffectFn1 xyxyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYXYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYXYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXXDownGroup" true
    p <- runEffectFn1 xyyxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXXRightGroup" true
    p <- runEffectFn1 xyyxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXYDownGroup" true
    p <- runEffectFn1 xyyxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXYRightGroup" true
    p <- runEffectFn1 xyyxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYXDownGroup" true
    p <- runEffectFn1 xyyxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYXRightGroup" true
    p <- runEffectFn1 xyyxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYYDownGroup" true
    p <- runEffectFn1 xyyxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYYRightGroup" true
    p <- runEffectFn1 xyyxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXXDownGroup" true
    p <- runEffectFn1 xyyyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXXRightGroup" true
    p <- runEffectFn1 xyyyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXYDownGroup" true
    p <- runEffectFn1 xyyyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXYRightGroup" true
    p <- runEffectFn1 xyyyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYXDownGroup" true
    p <- runEffectFn1 xyyyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYXRightGroup" true
    p <- runEffectFn1 xyyyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.XYYYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYYDownGroup" true
    p <- runEffectFn1 xyyyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.XYYYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYYRightGroup" true
    p <- runEffectFn1 xyyyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.XYYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.XYYYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.XYYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "XYYYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXXDownGroup" true
    p <- runEffectFn1 yxxxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXXRightGroup" true
    p <- runEffectFn1 yxxxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXYDownGroup" true
    p <- runEffectFn1 yxxxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXYRightGroup" true
    p <- runEffectFn1 yxxxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYXDownGroup" true
    p <- runEffectFn1 yxxxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYXRightGroup" true
    p <- runEffectFn1 yxxxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYYDownGroup" true
    p <- runEffectFn1 yxxxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYYRightGroup" true
    p <- runEffectFn1 yxxxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXXDownGroup" true
    p <- runEffectFn1 yxxyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXXRightGroup" true
    p <- runEffectFn1 yxxyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXYDownGroup" true
    p <- runEffectFn1 yxxyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXYRightGroup" true
    p <- runEffectFn1 yxxyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYXDownGroup" true
    p <- runEffectFn1 yxxyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYXRightGroup" true
    p <- runEffectFn1 yxxyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXXYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYYDownGroup" true
    p <- runEffectFn1 yxxyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXXYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYYRightGroup" true
    p <- runEffectFn1 yxxyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXXYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXXYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXXDownGroup" true
    p <- runEffectFn1 yxyxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXXRightGroup" true
    p <- runEffectFn1 yxyxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXYDownGroup" true
    p <- runEffectFn1 yxyxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXYRightGroup" true
    p <- runEffectFn1 yxyxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYXDownGroup" true
    p <- runEffectFn1 yxyxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYXRightGroup" true
    p <- runEffectFn1 yxyxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYYDownGroup" true
    p <- runEffectFn1 yxyxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYYRightGroup" true
    p <- runEffectFn1 yxyxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXXDownGroup" true
    p <- runEffectFn1 yxyyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXXRightGroup" true
    p <- runEffectFn1 yxyyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXYDownGroup" true
    p <- runEffectFn1 yxyyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXYRightGroup" true
    p <- runEffectFn1 yxyyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYXDownGroup" true
    p <- runEffectFn1 yxyyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYXRightGroup" true
    p <- runEffectFn1 yxyyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YXYYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYYDownGroup" true
    p <- runEffectFn1 yxyyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YXYYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYYRightGroup" true
    p <- runEffectFn1 yxyyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YXYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YXYYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YXYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YXYYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXXDownGroup" true
    p <- runEffectFn1 yyxxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXXRightGroup" true
    p <- runEffectFn1 yyxxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXYDownGroup" true
    p <- runEffectFn1 yyxxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXYRightGroup" true
    p <- runEffectFn1 yyxxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYXDownGroup" true
    p <- runEffectFn1 yyxxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYXRightGroup" true
    p <- runEffectFn1 yyxxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYYDownGroup" true
    p <- runEffectFn1 yyxxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYYRightGroup" true
    p <- runEffectFn1 yyxxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXXDownGroup" true
    p <- runEffectFn1 yyxyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXXRightGroup" true
    p <- runEffectFn1 yyxyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXYDownGroup" true
    p <- runEffectFn1 yyxyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXYRightGroup" true
    p <- runEffectFn1 yyxyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYXDownGroup" true
    p <- runEffectFn1 yyxyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYXRightGroup" true
    p <- runEffectFn1 yyxyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYXYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYYDownGroup" true
    p <- runEffectFn1 yyxyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYXYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYYRightGroup" true
    p <- runEffectFn1 yyxyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYXYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYXYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYXYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYXYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXXDownGroup" true
    p <- runEffectFn1 yyyxxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXXRightGroup" true
    p <- runEffectFn1 yyyxxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXYDownGroup" true
    p <- runEffectFn1 yyyxxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXYRightGroup" true
    p <- runEffectFn1 yyyxxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYXDownGroup" true
    p <- runEffectFn1 yyyxyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYXRightGroup" true
    p <- runEffectFn1 yyyxyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYXYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYYDownGroup" true
    p <- runEffectFn1 yyyxyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYXYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYYRightGroup" true
    p <- runEffectFn1 yyyxyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYXYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYXYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYXYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYXYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYXXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXXDownGroup" true
    p <- runEffectFn1 yyyyxxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYXXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXXRightGroup" true
    p <- runEffectFn1 yyyyxxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYXXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYXXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYXXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYXYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXYDownGroup" true
    p <- runEffectFn1 yyyyxyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYXYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXYRightGroup" true
    p <- runEffectFn1 yyyyxyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYXYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYXYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYXYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYXYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYYXDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYXDownGroup" true
    p <- runEffectFn1 yyyyyxDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYYXRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYXRightGroup" true
    p <- runEffectFn1 yyyyyxRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYYXContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYXContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYYXTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYXTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYYXTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYXTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e

---
instance PathWalker a r => PathWalker (Path.YYYYYYDownGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYYDownGroup" true
    p <- runEffectFn1 yyyyyyDownGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance PathWalker a r => PathWalker (Path.YYYYYYRightGroup a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYYRightGroup" true
    p <- runEffectFn1 yyyyyyRightGroup e
    runEffectFn4 walk (Proxy :: _ a) r di p
instance (ProcessInstructions r zz, PathWalker a r) => PathWalker (Path.YYYYYYContGroupWithMarkers zz a) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYYContGroupWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
instance (PathWalker a r, PathWalker b r) => PathWalker (Path.YYYYYYTwoContGroups a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYYTwoContGroups" true
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
instance (PathWalker a r, PathWalker b r, ProcessInstructions r zz) => PathWalker (Path.YYYYYYTwoContGroupsWithMarkers zz a b) r where
  walk = mkEffectFn4 \_ r di e -> do
    let _ = spy "YYYYYYTwoContGroupsWithMarkers" true
    runEffectFn4 processInstructions (Proxy :: _ zz) r di e
    runEffectFn4 walk (Proxy :: _ a) r di e
    runEffectFn4 walk (Proxy :: _ b) r di e
