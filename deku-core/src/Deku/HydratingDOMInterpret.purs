module Deku.HydratingDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (STFn2, mkSTFn1, mkSTFn2)
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray, toArray)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (class Newtype, un)
import Data.Traversable (traverse)
import Deku.Core (AttachElement, Attribute', MakeElement)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Internal.Entities (DekuParent(..), fromDekuElement, toDekuElement)
import Deku.Internal.Region (Anchor(..))
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn2, mkEffectFn3, runEffectFn2, runEffectFn3)
import FRP.Poll (Poll)
import Foreign.Object (Object)
import Foreign.Object as Object
import Unsafe.Reference (unsafeRefEq)
import Web.DOM as Web.DOM
import Web.DOM.ParentNode (QuerySelector(..), querySelector)

newtype HydrationRenderingInfo = HydrationRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Maybe (NonEmptyArray Int)
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  , isBoring :: Boolean
  }

derive instance Newtype HydrationRenderingInfo _

getUseableAttributes
  :: Object HydrationRenderingInfo
  -> STFn2 Int (Array (Poll Attribute')) Global (Array (Poll Attribute'))
getUseableAttributes renderingInfo = mkSTFn2 \tag atts -> pure $ fromMaybe atts
  do
    HydrationRenderingInfo ri <- Object.lookup (show tag) renderingInfo
    indices <- ri.attributeIndicesThatAreNeededDuringHydration
    traverse (Array.index atts) (toArray indices)

makeElement
  :: Object HydrationRenderingInfo
  -> Web.DOM.Element
  -> Web.DOM.ParentNode
  -> MakeElement
makeElement renderingInfo dummyElement parentNode = mkEffectFn3 \id ns tag -> do
  let idS = show id
  let ri = Object.lookup idS renderingInfo
  let createNew = runEffectFn3 I.makeElementEffect id ns tag
  case ri of
    -- shouldn't happen
    Nothing -> createNew
    Just (HydrationRenderingInfo value) -> do
      case
        value.hasParentThatWouldDisqualifyFromSSR
          || value.hasChildrenThatWouldDisqualifyFromSSR
          || value.attributeIndicesThatAreNeededDuringHydration /= Nothing
        of
        true -> do
          sel <- querySelector
            (QuerySelector $ "[data-deku-ssr=\"" <> idS <> "\"]")
            parentNode
          case sel of
            -- shouldn't happen
            Nothing -> createNew
            Just el -> pure $ toDekuElement el
        false -> pure $ toDekuElement dummyElement

attachElement :: Web.DOM.Element -> AttachElement
attachElement dummyElement = mkEffectFn2 \node anchor -> case anchor of
  ParentStart (DekuParent parent) -> when
    (not (unsafeRefEq (fromDekuElement parent) dummyElement))
    (runEffectFn2 I.attachElementEffect node anchor)

  Element el -> when (not (unsafeRefEq (fromDekuElement el) dummyElement))
    (runEffectFn2 I.attachElementEffect node anchor)

  _ -> runEffectFn2 I.attachElementEffect node anchor

hydratingDOMInterpret
  :: ST.ST Global Int
  -> Object HydrationRenderingInfo
  -> Web.DOM.Element
  -> Web.DOM.ParentNode
  -> Core.DOMInterpret
hydratingDOMInterpret tagger renderingInfo dummyElement parentNode =
  Core.DOMInterpret
    { tagger
    , staticDOMInterpret: \_ -> hydratingDOMInterpret tagger renderingInfo
        dummyElement
        parentNode
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    , dynamicDOMInterpret: \_ -> fullDOMInterpret tagger
    --
    , isBoring: \tag ->
        maybe false (un HydrationRenderingInfo >>> _.isBoring) $ Object.lookup
          (show tag)
          renderingInfo
    , registerParentChildRelationship: mkSTFn2 \_ _ -> pure unit
    , makeElement: makeElement renderingInfo dummyElement parentNode
    , attachElement: attachElement dummyElement
    , getUseableAttributes: getUseableAttributes renderingInfo
    , incrementElementCount: mkSTFn1 \_ -> pure unit
    , disqualifyFromStaticRendering: mkSTFn1 \_ -> pure unit
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    --
    , makeText: I.makeTextEffect
    , attachText: I.attachTextEffect
    , setText: I.setTextEffect
    , removeText: I.removeTextEffect
    , incrementPureTextCount: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
    }