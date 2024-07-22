module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn2, runSTFn3)
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray, fromArray)
import Data.Compactable (compact)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, over, un)
import Deku.Core (Attribute', ChildId(..), MakeElement, ParentId(..))
import Deku.Core as Core
import Deku.Internal.Entities (fromDekuElement)
import Deku.Internal.Region (CurrentStaticRegionStats(..), StaticRegion(..), StaticRegionStats(..))
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn3, runEffectFn3)
import FRP.Poll (Poll(..))
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

getUseableAttributes
  :: STObject Global SSRRenderingInfo
  -> STFn2 Int (Array (Poll Attribute')) Global (Array (Poll Attribute'))
getUseableAttributes renderingInfo = mkSTFn2 \id arr -> do
  let tag = show id
  currentSSRRenderingInfo <- peek tag renderingInfo
  void $ poke tag
    ( over SSRRenderingInfo _
        { attributeIndicesThatAreNeededDuringHydration = fromArray $ compact
            $ mapWithIndex
                ( \i -> case _ of
                    OnlyPure _ -> Nothing
                    _ -> Just i
                )
                arr
        }
        $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
    )
    renderingInfo

  pure arr

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

ssrDOMInterpret
  :: ST.ST Global Int
  -> String
  -> STObject Global (Array String)
  -> STObject Global SSRRenderingInfo
  -> Core.DOMInterpret
ssrDOMInterpret tagger impureTextTag parentChildCache renderingInfo =
  Core.DOMInterpret
    { tagger
    , staticDOMInterpret: \_ -> ssrDOMInterpret tagger impureTextTag
        parentChildCache
        renderingInfo
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    , dynamicDOMInterpret: \_ -> ssrDOMInterpret tagger impureTextTag
        parentChildCache
        renderingInfo
    --
    , isBoring: const false
    , registerParentChildRelationship: mkSTFn2
        \(ParentId parent) (ChildId child) -> do
          let tag = show parent
          parentChildArray <- peek tag parentChildCache
          void $ poke tag
            (Array.cons (show child) $ fromMaybe [] parentChildArray)
            parentChildCache
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
    , makeText: mkEffectFn3 \id mtext isPure -> runEffectFn3 I.makeTextEffect id
        ( append (if isPure then "" else show id <> "_" <> impureTextTag) <$>
            mtext
        )
        isPure
    , attachText: I.attachTextEffect
    , setText: I.setTextEffect
    , removeText: I.removeTextEffect
    , incrementPureTextCount: incrementPureTextCount renderingInfo
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
    }