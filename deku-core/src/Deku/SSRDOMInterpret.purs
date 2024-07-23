module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn2, runSTFn3)
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, over, un)
import Debug (spy)
import Deku.Core (ChildId(..), MakeElement, ParentId(..))
import Deku.Core as Core
import Deku.Internal.Entities (fromDekuElement)
import Deku.Internal.Region (CurrentStaticRegionStats(..), StaticRegion(..), StaticRegionStats(..))
import Deku.Interpret as I
import Effect.Console (log)
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, runEffectFn3, runEffectFn4)
import Foreign.Object.ST (STObject, peek, poke)
import Web.DOM as Web.DOM

newtype SSRRenderingInfo = SSRRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Maybe (NonEmptyArray Int)
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  , backingElement :: Maybe Web.DOM.Element
  }

derive instance Newtype SSRRenderingInfo _

initialSSRRenderingInfo :: SSRRenderingInfo
initialSSRRenderingInfo = SSRRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration: Nothing
  , hasParentThatWouldDisqualifyFromSSR: true
  , hasChildrenThatWouldDisqualifyFromSSR: true
  , backingElement: Nothing
  }

disqualifyFromStaticRendering
  :: STObject Global SSRRenderingInfo -> STFn1 Int Global Unit
disqualifyFromStaticRendering renderingInfo = mkSTFn1 \id -> do
  let tag = show id
  currentSSRRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( over SSRRenderingInfo _
        { hasParentThatWouldDisqualifyFromSSR = true
        }
        $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
    )
    renderingInfo

addElementToCache
  :: STFn3 Int (STObject Global SSRRenderingInfo) Web.DOM.Element Global Unit
addElementToCache = mkSTFn3 \id renderingInfo elt -> do
  let tag = show id
  currentSSRRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( over SSRRenderingInfo _
        { backingElement = Just elt
        }
        $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
    )
    renderingInfo

updateSSRRenderingInfo
  :: STFn2 (STObject Global SSRRenderingInfo) StaticRegion Global Unit
updateSSRRenderingInfo = mkSTFn2 \renderingInfo (StaticRegion region) -> do
  CurrentStaticRegionStats currentStats <-
    (un StaticRegionStats region.stats).getCurrentStaticRegionStats
  let tag = show region.tag
  let
    containsOnlyElements = Just currentStats.numberOfChildrenThatAreElements ==
      currentStats.childCount
  let
    containsOnlyStaticText = currentStats.numberOfChildrenThatAreElements == 0
      && currentStats.numberOfChildrenThatAreStaticTextNodes == 1
  currentSSRRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( over SSRRenderingInfo _
        { hasChildrenThatWouldDisqualifyFromSSR = not
            (containsOnlyElements || containsOnlyStaticText)
        }
        $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
    )
    renderingInfo

incrementElementCount
  :: STObject Global SSRRenderingInfo -> STFn1 StaticRegion Global Unit
incrementElementCount renderingInfo = mkSTFn1 \region -> do
  (un StaticRegionStats (un StaticRegion region).stats).incrementElementChildCount
  runSTFn2 updateSSRRenderingInfo renderingInfo region

incrementPureTextCount
  :: STObject Global SSRRenderingInfo -> STFn1 StaticRegion Global Unit
incrementPureTextCount renderingInfo = mkSTFn1 \region -> do
  (un StaticRegionStats (un StaticRegion region).stats).incrementStaticTextChildCount
  runSTFn2 updateSSRRenderingInfo renderingInfo region

makeElement :: STObject Global SSRRenderingInfo -> MakeElement
makeElement renderingInfo = mkEffectFn3 \id ns tag -> do
  elt <- runEffectFn3 I.makeElementEffect id ns tag
  liftST $ runSTFn3 addElementToCache id renderingInfo (fromDekuElement elt)
  pure elt

registerParentChildRelationship
  :: STObject Global (Array String) -> STFn2 ParentId ChildId Global Unit
registerParentChildRelationship parentChildCache = mkSTFn2
  \(ParentId parent) (ChildId child) -> do
    let tag = show parent
    parentChildArray <- peek tag parentChildCache
    void $ poke tag
      (Array.cons (show child) $ fromMaybe [] parentChildArray)
      parentChildCache

ssrDOMInterpret
  :: ST.ST Global Int
  -> String
  -> STObject Global (Array String)
  -> STObject Global SSRRenderingInfo
  -> Core.DOMInterpret
ssrDOMInterpret tagger impureTextTag parentChildCache renderingInfo =
  Core.DOMInterpret
    { tagger
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    , dynamicDOMInterpret: \_ -> noOpDomInterpret tagger
    --
    , isBoring: const false
    , registerParentChildRelationship: registerParentChildRelationship
        parentChildCache
    , makeElement: makeElement renderingInfo
    , attachElement: I.attachElementEffect
    , incrementElementCount: incrementElementCount renderingInfo
    , disqualifyFromStaticRendering: disqualifyFromStaticRendering renderingInfo
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    --
    , makeText: mkEffectFn3 \id mtext doesNotNeedReferenceInDOM -> do
        log $ "making text: " <> show { id, mtext, doesNotNeedReferenceInDOM }
        runEffectFn3 I.makeTextEffect id
          ( Just $ (if doesNotNeedReferenceInDOM then "" else show id <> "_" <> impureTextTag) <>
              fromMaybe "" mtext
          )
          doesNotNeedReferenceInDOM
    , attachText: I.attachTextEffect
    , setText: mkEffectFn4 \id txt elt doesNotNeedReferenceInDOM -> do
        log $ "making text: " <> show { id, txt, doesNotNeedReferenceInDOM }
        runEffectFn4 I.setTextEffect id
          (  (if doesNotNeedReferenceInDOM then "" else show id <> "_" <> impureTextTag) <>
              txt
          )
          elt
          doesNotNeedReferenceInDOM
    
    
    , removeText: I.removeTextEffect
    , incrementPureTextCount: incrementPureTextCount renderingInfo
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
    }

noOpDomInterpret
  :: ST.ST Global Int
  -> Core.DOMInterpret
noOpDomInterpret tagger =
  Core.DOMInterpret
    { tagger
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    , dynamicDOMInterpret: \_ -> noOpDomInterpret tagger
    --
    , isBoring: const false
    , registerParentChildRelationship: mkSTFn2 \_ _ -> pure unit
    , makeElement: I.makeElementEffect
    , attachElement: mkEffectFn2 \a b ->
        let _ = spy "attach element in noop" { a, b } in pure unit
    , incrementElementCount: mkSTFn1 \_ -> pure unit
    , disqualifyFromStaticRendering: mkSTFn1 \_ -> pure unit
    , setProp: mkEffectFn3 \_ _ _ -> pure unit
    , setCb: mkEffectFn3 \_ _ _ -> pure unit
    , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
    , removeElement: mkEffectFn1 \_ -> pure unit
    --
    , makeText: I.makeTextEffect
    , attachText: mkEffectFn2 \_ _ -> pure unit
    , setText: mkEffectFn4 \_ _ _ _ -> pure unit
    , removeText: mkEffectFn1 \_ -> pure unit
    , incrementPureTextCount: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: mkEffectFn3 \_ _ _ -> pure unit
    , bufferPortal: I.bufferPortal
    }