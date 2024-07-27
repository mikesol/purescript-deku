module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, STFn4, mkSTFn1, mkSTFn2, mkSTFn3, mkSTFn4, runSTFn3)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, over)
import Data.Set (Set)
import Data.Set as Set
import Deku.Core (AttrIndex, MakeText, ParentTag, SetText)
import Deku.Core as Core
import Deku.Internal.Entities (DekuElement, DekuText)
import Deku.Internal.Region (ElementId, elementIdToString)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3, runEffectFn2, runEffectFn3)

updateRenderingInfo
  :: forall k a
   . Ord k
  => STFn3 k (a -> a)
       (STRef.STRef Global (Map.Map k a))
       Global
       Unit
updateRenderingInfo = mkSTFn3 \id fn renderingInfo -> do
  void $ STRef.modify (Map.alter (map fn) id) renderingInfo

type SSRElementRenderingInfoCache = Map.Map ElementId SSRElementRenderingInfo

newtype SSRElementRenderingInfo = SSRElementRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Set AttrIndex
  , parentIs :: ParentTag
  , childCount :: Int
  , numberOfChildrenThatAreElements :: Int
  , numberOfChildrenThatAreStaticTextNodes :: Int
  , backingElement :: DekuElement
  }

derive instance Newtype SSRElementRenderingInfo _

incrementElementCount
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn1 ElementId Global Unit
incrementElementCount renderingInfo = mkSTFn1 \id -> do
  runSTFn3 updateRenderingInfo id f renderingInfo
  where
  f = over SSRElementRenderingInfo \r -> r
    { numberOfChildrenThatAreElements = r.numberOfChildrenThatAreElements + 1 }

initializeElementRendering
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn4 ElementId DekuElement Int ParentTag Global Unit
initializeElementRendering renderingInfo = mkSTFn4
  \id backingElement childCount parentIs -> do
    void $ STRef.modify
      ( Map.alter
          ( const $ Just $ SSRElementRenderingInfo
              { attributeIndicesThatAreNeededDuringHydration: Set.empty
              , parentIs
              , childCount
              , numberOfChildrenThatAreElements: 0
              , numberOfChildrenThatAreStaticTextNodes: 0
              , backingElement
              }
          )
          id
      )
      renderingInfo

incrementPureTextCount
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn1 ElementId Global Unit
incrementPureTextCount renderingInfo = mkSTFn1 \id -> do
  runSTFn3 updateRenderingInfo id f renderingInfo
  where
  f = over SSRElementRenderingInfo \r -> r
    { numberOfChildrenThatAreStaticTextNodes =
        r.numberOfChildrenThatAreStaticTextNodes + 1
    }

setText :: String -> SetText
setText impureTextTag = mkEffectFn3 \id txt elt -> do
  runEffectFn3 I.setTextEffect id
    ( show id <> "_" <> impureTextTag <> txt
    )
    elt

markIndexAsNeedingHydration
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn2 ElementId AttrIndex Global Unit
markIndexAsNeedingHydration renderingInfo = mkSTFn2 \id ix -> do
  runSTFn3 updateRenderingInfo id
    ( over SSRElementRenderingInfo
        ( \i@{ attributeIndicesThatAreNeededDuringHydration } ->
            i
              { attributeIndicesThatAreNeededDuringHydration =
                  Set.insert
                    ix
                    attributeIndicesThatAreNeededDuringHydration
              }
        )
    )
    renderingInfo

type SSRTextRenderingInfoCache = Map.Map ElementId SSRTextRenderingInfo

newtype SSRTextRenderingInfo = SSRTextRenderingInfo
  {   parentIs :: ParentTag
   , isVolatile :: Boolean
  , backingText :: DekuText
  }

derive instance Newtype SSRTextRenderingInfo _

initializeTextRendering
  :: STRef.STRef Global SSRTextRenderingInfoCache
  -> STFn4 ElementId DekuText Boolean ParentTag Global Unit
initializeTextRendering renderingInfo = mkSTFn4
  \id backingText isVolatile parentIs -> do
    void $ STRef.modify
      ( Map.alter
          ( const $ Just $ SSRTextRenderingInfo
              { parentIs
              , isVolatile
              , backingText
              }
          )
          id
      )
      renderingInfo

makeText :: String -> MakeText
makeText impureTextTag = mkEffectFn2 \id mtext -> do
  runEffectFn2 I.makeTextEffect id
    ( Just $
        elementIdToString id <> "_" <> impureTextTag <> fromMaybe "" mtext
    )

ssrDOMInterpret
  :: ST.ST Global Int
  -> String
  -> STRef.STRef Global SSRTextRenderingInfoCache
  -> STRef.STRef Global SSRElementRenderingInfoCache
  -> Core.DOMInterpret
ssrDOMInterpret tagger impureTextTag textRenderingInfo elementRenderingInfo =
  Core.DOMInterpret
    { tagger
    , dynamicDOMInterpret: \_ -> noOpDomInterpret tagger
    --
    , isBoring: const false
    , makeElement: I.makeElementEffect
    , attachElement: I.attachElementEffect
    , incrementElementCount: incrementElementCount elementRenderingInfo
    , initializeElementRendering: initializeElementRendering
        elementRenderingInfo
    , initializeTextRendering: initializeTextRendering textRenderingInfo
    , markIndexAsNeedingHydration: markIndexAsNeedingHydration
        elementRenderingInfo
    , shouldSkipAttribute: \_ _ -> false
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    --
    , makeText: makeText impureTextTag
    , attachText: I.attachTextEffect
    , setText: setText impureTextTag
    , removeText: I.removeTextEffect
    , incrementPureTextCount: incrementPureTextCount elementRenderingInfo
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
    , markIndexAsNeedingHydration: mkSTFn2 \_ _ -> pure unit
    , shouldSkipAttribute: \_ _ -> false
    , makeElement: I.makeElementEffect
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , initializeElementRendering: mkSTFn4 \_ _ _ _ -> pure unit
    , initializeTextRendering: mkSTFn4 \_ _ _ _ -> pure unit
    , incrementElementCount: mkSTFn1 \_ -> pure unit
    , setProp: mkEffectFn3 \_ _ _ -> pure unit
    , setCb: mkEffectFn3 \_ _ _ -> pure unit
    , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
    , removeElement: mkEffectFn1 \_ -> pure unit
    --
    , makeText: I.makeTextEffect
    , attachText: mkEffectFn2 \_ _ -> pure unit
    , setText: mkEffectFn3 \_ _ _ -> pure unit
    , removeText: mkEffectFn1 \_ -> pure unit
    , incrementPureTextCount: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: mkEffectFn3 \_ _ _ -> pure unit
    , bufferPortal: I.bufferPortal
    }