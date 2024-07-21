module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn2, runSTFn3)
import Data.Compactable (compact)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, over, un)
import Deku.Core (Attribute', MakeElement)
import Deku.Core as Core
import Deku.Internal.Entities (fromDekuElement)
import Deku.Internal.Region (CurrentStaticRegionStats(..), StaticRegion(..), StaticRegionStats(..))
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn3, runEffectFn3)
import FRP.Poll (Poll(..))
import Foreign.Object.ST (STObject, peek, poke)
import Web.DOM as Web.DOM

newtype RenderingInfo = RenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Maybe (Array Int)
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  , backingElement :: Maybe Web.DOM.Element
  }

derive instance Newtype RenderingInfo _

initialRenderingInfo :: RenderingInfo
initialRenderingInfo = RenderingInfo
  { attributeIndicesThatAreNeededDuringHydration: Nothing
  , hasParentThatWouldDisqualifyFromSSR: true
  , hasChildrenThatWouldDisqualifyFromSSR: true
  , backingElement: Nothing
  }

getUseableAttributes
  :: STObject Global RenderingInfo
  -> STFn2 Int (Array (Poll Attribute')) Global (Array (Poll Attribute'))
getUseableAttributes renderingInfo = mkSTFn2 \id arr -> do
  let tag = show id
  currentRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( maybe initialRenderingInfo
        ( over RenderingInfo _
            { attributeIndicesThatAreNeededDuringHydration = Just $ compact
                $ mapWithIndex
                    ( \i -> case _ of
                        OnlyPure _ -> Nothing
                        _ -> Just i
                    )
                    arr
            }
        )
        currentRenderingInfo
    )
    renderingInfo
  pure arr

disqualifyFromStaticRendering
  :: STObject Global RenderingInfo -> STFn1 Int Global Unit
disqualifyFromStaticRendering renderingInfo = mkSTFn1 \id -> do
  let tag = show id
  currentRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( maybe initialRenderingInfo
        ( over RenderingInfo _
            { hasParentThatWouldDisqualifyFromSSR = true
            }
        )
        currentRenderingInfo
    )
    renderingInfo

addElementToCache
  :: STFn3 Int (STObject Global RenderingInfo) Web.DOM.Element Global Unit
addElementToCache = mkSTFn3 \id renderingInfo elt -> do
  let tag = show id
  currentRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( maybe initialRenderingInfo
        ( over RenderingInfo _
            { backingElement = Just elt
            }
        )
        currentRenderingInfo
    )
    renderingInfo

updateRenderingInfo
  :: STFn2 (STObject Global RenderingInfo) StaticRegion Global Unit
updateRenderingInfo = mkSTFn2 \renderingInfo (StaticRegion region) -> do
  CurrentStaticRegionStats currentStats <-
    (un StaticRegionStats region.stats).getCurrentStaticRegionStats
  let tag = show region.tag
  let
    containsOnlyElements = Just currentStats.numberOfChildrenThatAreElements ==
      currentStats.childCount
  let
    containsOnlyStaticText = currentStats.numberOfChildrenThatAreElements == 0
      && currentStats.numberOfChildrenThatAreStaticTextNodes == 1
  currentRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( maybe initialRenderingInfo
        ( over RenderingInfo _
            { hasChildrenThatWouldDisqualifyFromSSR = not
                (containsOnlyElements || containsOnlyStaticText)
            }
        )
        currentRenderingInfo
    )
    renderingInfo

incrementElementCount
  :: STObject Global RenderingInfo -> STFn1 StaticRegion Global Unit
incrementElementCount renderingInfo = mkSTFn1 \region -> do
  (un StaticRegionStats (un StaticRegion region).stats).incrementElementChildCount
  runSTFn2 updateRenderingInfo renderingInfo region

incrementPureTextCount
  :: STObject Global RenderingInfo -> STFn1 StaticRegion Global Unit
incrementPureTextCount renderingInfo = mkSTFn1 \region -> do
  (un StaticRegionStats (un StaticRegion region).stats).incrementStaticTextChildCount
  runSTFn2 updateRenderingInfo renderingInfo region

makeElement :: STObject Global RenderingInfo -> MakeElement
makeElement renderingInfo = mkEffectFn3 \id ns tag -> do
  elt <- runEffectFn3 I.makeElementEffect id ns tag
  liftST $ runSTFn3 addElementToCache id renderingInfo (fromDekuElement elt)
  pure elt

ssrDOMInterpret
  :: ST.ST Global Int -> STObject Global RenderingInfo -> Core.DOMInterpret
ssrDOMInterpret tagger renderingInfo = Core.DOMInterpret
  { tagger
  , staticDOMInterpret: \_ -> ssrDOMInterpret tagger renderingInfo
  -- we could likely make `dynamicDOMInterpret` a no-op
  -- should be harmless, though, as this will be called rarely if at all
  -- because SSR code will only trigger dynamic elements
  -- in case there's a dyn with pure polls that aren't optimized as being pure
  , dynamicDOMInterpret: \_ -> ssrDOMInterpret tagger renderingInfo
  --
  , isBoring: mkSTFn1 \_ -> pure false
  , makeElement: makeElement renderingInfo
  , attachElement: I.attachElementEffect
  , getUseableAttributes: getUseableAttributes renderingInfo
  , incrementElementCount: incrementElementCount renderingInfo
  , disqualifyFromStaticRendering: disqualifyFromStaticRendering renderingInfo
  , setProp: I.setPropEffect
  , setCb: I.setCbEffect
  , unsetAttribute: I.unsetAttributeEffect
  , removeElement: I.removeElementEffect
  --
  , makeText: I.makeTextEffect
  , attachText: I.attachTextEffect
  , setText: I.setTextEffect
  , removeText: I.removeTextEffect
  , incrementPureTextCount: incrementPureTextCount renderingInfo
  --
  , beamRegion: I.beamRegionEffect
  , bufferPortal: I.bufferPortal
  }