module Deku.HydratingDOMInterpret
  ( HydrationRenderingInfo(..)
  , hydratingDOMInterpret
  , makeElement
  , makeText
  )
  where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2, mkSTFn4)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (class Newtype, un)
import Data.Set as Set
import Deku.Core (AttrIndex, MakeElement, MakeText)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Internal.Entities (toDekuElement, toDekuText)
import Deku.Internal.Region (ElementId, elementIdToString)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn2, mkEffectFn3)
import Web.DOM as Web.DOM
import Web.DOM.ParentNode (QuerySelector(..), querySelector)

newtype HydrationRenderingInfo = HydrationRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Set.Set AttrIndex
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  , isBoring :: Boolean
  }

derive instance Newtype HydrationRenderingInfo _

makeElement
  :: Map.Map ElementId HydrationRenderingInfo
  -> Web.DOM.Element
  -> Web.DOM.ParentNode
  -> MakeElement
makeElement renderingInfo dummyElement parentNode = mkEffectFn3 \id _ _ -> do
  let ri = Map.lookup id renderingInfo
  case ri of
    Nothing -> pure $ toDekuElement dummyElement
    Just (HydrationRenderingInfo value) -> do
      case
        value.hasParentThatWouldDisqualifyFromSSR
          || value.hasChildrenThatWouldDisqualifyFromSSR
          ||
            ( not $ Set.isEmpty
                value.attributeIndicesThatAreNeededDuringHydration
            )
        of
        true -> do
          sel <- querySelector
            ( QuerySelector $ "[data-deku-ssr=\"" <> elementIdToString id <>
                "\"]"
            )
            parentNode
          case sel of
            -- shouldn't happen
            Nothing ->  pure $ toDekuElement dummyElement
            Just el -> pure $ toDekuElement el
        false ->  pure $ toDekuElement dummyElement

makeText :: Map.Map ElementId Web.DOM.Text -> Web.DOM.Text -> MakeText
makeText textNodeCache dummyText = mkEffectFn2 \id _ -> pure $ toDekuText
  case Map.lookup id textNodeCache of
    Nothing -> dummyText
    Just t ->  t

shouldSkipAttribute
  :: Map.Map ElementId HydrationRenderingInfo
  -> ElementId
  -> AttrIndex
  -> Boolean
shouldSkipAttribute renderingInfo id ix = fromMaybe false do
  ri <- Map.lookup id renderingInfo
  pure $ not $ Set.member ix
    (un HydrationRenderingInfo ri).attributeIndicesThatAreNeededDuringHydration

hydratingDOMInterpret
  :: ST.ST Global Int
  -> Map.Map ElementId HydrationRenderingInfo
  -> Map.Map ElementId Web.DOM.Text
  -> Web.DOM.Text
  -> Web.DOM.Element
  -> Web.DOM.ParentNode
  -> Core.DOMInterpret
hydratingDOMInterpret
  tagger
  renderingInfo
  textNodeCache
  dummyText
  dummyElement
  parentNode =
  Core.DOMInterpret
    { tagger
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    , dynamicDOMInterpret: \_ -> fullDOMInterpret tagger
    --
    , isBoring: \tag ->
        maybe false (un HydrationRenderingInfo >>> _.isBoring) $ Map.lookup
          tag
          renderingInfo
    , makeElement: makeElement renderingInfo dummyElement parentNode
    -- attachments should never happen during hydration
    -- the dynamicDOMInterpret should always kick in
    -- when an attachment actually needs to occur
    -- so we make it a noop
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , initializeElementRendering: mkSTFn4 \_ _ _ _ -> pure unit
    , initializeTextRendering: mkSTFn4 \_ _ _ _ -> pure unit
    , incrementElementCount: mkSTFn1 \_ -> pure unit
    , markIndexAsNeedingHydration: mkSTFn2 \_ _ -> pure unit
    , shouldSkipAttribute: shouldSkipAttribute renderingInfo
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    , makeText: makeText textNodeCache dummyText
    , attachText: mkEffectFn2 \_ _ -> pure unit
    -- text setting should never happen during hydration
    , setText: mkEffectFn3 \_ _ _ -> pure unit
    , removeText: I.removeTextEffect
    , incrementPureTextCount: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
    }