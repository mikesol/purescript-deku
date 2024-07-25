module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn2, runSTFn3)
import Data.List (List)
import Data.List as List
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, over, un)
import Data.Set (Set)
import Data.Set as Set
import Deku.Core (AttrIndex, ChildId, MakeElement, MakeText, ParentId, SetText)
import Deku.Core as Core
import Deku.Internal.Entities (fromDekuElement)
import Deku.Internal.Region (CurrentStaticRegionStats(..), ElementId, StaticRegion(..), StaticRegionStats(..), elementIdToString)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, runEffectFn3, runEffectFn4)
import Web.DOM as Web.DOM

type SSRRenderingInfoCache = Map.Map ElementId SSRRenderingInfo

newtype SSRRenderingInfo = SSRRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Set AttrIndex
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  , backingElement :: Maybe Web.DOM.Element
  }

derive instance Newtype SSRRenderingInfo _

initialSSRRenderingInfo :: SSRRenderingInfo
initialSSRRenderingInfo = SSRRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration: Set.empty
  , hasParentThatWouldDisqualifyFromSSR: false
  , hasChildrenThatWouldDisqualifyFromSSR: false
  , backingElement: Nothing
  }

disqualifyFromStaticRendering
  :: STRef.STRef Global SSRRenderingInfoCache -> STFn1 ElementId Global Unit
disqualifyFromStaticRendering renderingInfo = mkSTFn1 \id -> do
  void $ STRef.modify
    ( Map.alter
        ( \currentSSRRenderingInfo ->
            Just
              $ over SSRRenderingInfo _
                  { hasParentThatWouldDisqualifyFromSSR = true
                  }
              $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
        )
        id
    )
    renderingInfo

addElementToCache
  :: STFn3 ElementId (STRef.STRef Global SSRRenderingInfoCache) Web.DOM.Element
       Global
       Unit
addElementToCache = mkSTFn3 \id renderingInfo elt -> do

  void $ STRef.modify
    ( Map.alter
        ( \currentSSRRenderingInfo ->
            Just
              $ over SSRRenderingInfo _
                  { backingElement = Just elt
                  }
              $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
        )
        id
    )
    renderingInfo

updateSSRRenderingInfo
  :: STFn2 (STRef.STRef Global SSRRenderingInfoCache) StaticRegion Global Unit
updateSSRRenderingInfo = mkSTFn2 \renderingInfo (StaticRegion region) -> do
  CurrentStaticRegionStats currentStats <-
    (un StaticRegionStats region.stats).getCurrentStaticRegionStats
  let
    containsOnlyElements = Just currentStats.numberOfChildrenThatAreElements ==
      currentStats.childCount
  let
    containsOnlyStaticText = currentStats.numberOfChildrenThatAreElements == 0
      && currentStats.numberOfChildrenThatAreStaticTextNodes == 1
  void $ STRef.modify
    ( Map.alter
        ( \currentSSRRenderingInfo ->
            Just
              $ over SSRRenderingInfo _
                  { hasChildrenThatWouldDisqualifyFromSSR = not
                      (containsOnlyElements || containsOnlyStaticText)
                  }
              $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
        )
        region.tag
    )
    renderingInfo

incrementElementCount
  :: STRef.STRef Global SSRRenderingInfoCache -> STFn1 StaticRegion Global Unit
incrementElementCount renderingInfo = mkSTFn1 \region -> do
  (un StaticRegionStats (un StaticRegion region).stats).incrementElementChildCount
  runSTFn2 updateSSRRenderingInfo renderingInfo region

initializeRendering
  :: STRef.STRef Global SSRRenderingInfoCache -> STFn1 StaticRegion Global Unit
initializeRendering renderingInfo = mkSTFn1 \region -> do
  runSTFn2 updateSSRRenderingInfo renderingInfo region

incrementPureTextCount
  :: STRef.STRef Global SSRRenderingInfoCache -> STFn1 StaticRegion Global Unit
incrementPureTextCount renderingInfo = mkSTFn1 \region -> do
  (un StaticRegionStats (un StaticRegion region).stats).incrementStaticTextChildCount
  runSTFn2 updateSSRRenderingInfo renderingInfo region

makeElement :: STRef.STRef Global SSRRenderingInfoCache -> MakeElement
makeElement renderingInfo = mkEffectFn3 \id ns tag -> do
  elt <- runEffectFn3 I.makeElementEffect id ns tag
  liftST $ runSTFn3 addElementToCache id renderingInfo (fromDekuElement elt)
  pure elt

registerParentChildRelationship
  :: STRef.STRef Global (Map.Map ParentId (List ChildId))
  -> STFn2 ParentId ChildId Global Unit
registerParentChildRelationship parentChildCache = mkSTFn2
  \parent child -> do
    void $ STRef.modify
      ( Map.alter
          ( \parentChildArray ->
              Just
                $ (List.Cons child $ fromMaybe List.Nil parentChildArray)
          )
          parent
      )
      parentChildCache

setText :: String -> SetText
setText impureTextTag = mkEffectFn4 \id txt elt doesNotNeedReferenceInDOM -> do
  runEffectFn4 I.setTextEffect id
    ( ( if doesNotNeedReferenceInDOM then ""
        else show id <> "_" <> impureTextTag
      ) <>
        txt
    )
    elt
    doesNotNeedReferenceInDOM

makeText :: String -> MakeText
makeText impureTextTag = mkEffectFn3 \id mtext doesNotNeedReferenceInDOM -> do
  runEffectFn3 I.makeTextEffect id
    ( Just $
        ( if doesNotNeedReferenceInDOM then ""
          else elementIdToString id <> "_" <> impureTextTag
        ) <>
          fromMaybe "" mtext
    )
    doesNotNeedReferenceInDOM

markIndexAsNeedingHydration
  :: STRef.STRef Global SSRRenderingInfoCache
  -> STFn2 ElementId AttrIndex Global Unit
markIndexAsNeedingHydration renderingInfo = mkSTFn2 \id ix -> do
  void $ STRef.modify
    ( Map.alter
        ( \currentSSRRenderingInfo ->
            Just
              $ over SSRRenderingInfo
                  ( \i@{ attributeIndicesThatAreNeededDuringHydration } ->
                      i
                        { attributeIndicesThatAreNeededDuringHydration =
                            Set.insert
                              ix
                              attributeIndicesThatAreNeededDuringHydration
                        }
                  )
              $ fromMaybe initialSSRRenderingInfo currentSSRRenderingInfo
        )
        id
    )
    renderingInfo

ssrDOMInterpret
  :: ST.ST Global Int
  -> String
  -> STRef.STRef Global (Map.Map ParentId (List ChildId))
  -> STRef.STRef Global SSRRenderingInfoCache
  -> Core.DOMInterpret
ssrDOMInterpret tagger impureTextTag parentChildCache renderingInfo =
  Core.DOMInterpret
    { tagger
    , dynamicDOMInterpret: \_ -> noOpDomInterpret tagger
    --
    , isBoring: const false
    , registerParentChildRelationship: registerParentChildRelationship
        parentChildCache
    , makeElement: makeElement renderingInfo
    , attachElement: I.attachElementEffect
    , incrementElementCount: incrementElementCount renderingInfo
    , initializeRendering: initializeRendering renderingInfo
    , disqualifyFromStaticRendering: disqualifyFromStaticRendering renderingInfo
    , markIndexAsNeedingHydration: markIndexAsNeedingHydration renderingInfo
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
    , markIndexAsNeedingHydration: mkSTFn2 \_ _ -> pure unit
    , shouldSkipAttribute: \_ _ -> false
    , registerParentChildRelationship: mkSTFn2 \_ _ -> pure unit
    , makeElement: I.makeElementEffect
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , initializeRendering: mkSTFn1 \_ -> pure unit
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