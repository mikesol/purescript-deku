module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (STFn1, STFn2, mkSTFn1, mkSTFn2, runSTFn2)
import Data.Compactable (compact)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, over, un)
import Deku.Core (Attribute')
import Deku.Core as Core
import Deku.Internal.Region (CurrentStaticRegionStats(..), StaticRegion(..), StaticRegionStats(..))
import Deku.Interpret as I
import FRP.Poll (Poll(..))
import Foreign.Object.ST (STObject, peek, poke)

newtype RenderingInfo = RenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Maybe (Array Int)
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  }

derive instance Newtype RenderingInfo _

initialRenderingInfo :: RenderingInfo
initialRenderingInfo = RenderingInfo
  { attributeIndicesThatAreNeededDuringHydration: Nothing
  , hasParentThatWouldDisqualifyFromSSR: true
  , hasChildrenThatWouldDisqualifyFromSSR: true
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

ssrDOMInterpret
  :: ST.ST Global Int -> STObject Global RenderingInfo -> Core.DOMInterpret
ssrDOMInterpret tagger renderingInfo = Core.DOMInterpret
  { tagger
  , inStaticPart: true
  --
  , makeElement: I.makeElementEffect
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