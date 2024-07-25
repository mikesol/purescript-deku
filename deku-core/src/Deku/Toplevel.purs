-- | These functions are used to run a Deku application.
module Deku.Toplevel
  ( runInElement
  , runInBody
  , ssrInElement
  , ssrInBody
  , hydrateInElement
  , hydrateInBody
  , SSROutput
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (STRef)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (runSTFn3)
import Data.Foldable (for_)
import Data.FoldableWithIndex (foldlWithIndex, forWithIndex_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.List (List)
import Data.List as List
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (over, un)
import Data.Set as Set
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Core (ChildId(..), Nut(..), ParentId(..), newPSR)
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.HydratingDOMInterpret (HydrationRenderingInfo(..), hydratingDOMInterpret)
import Deku.Internal.Entities (DekuParent(..), toDekuElement)
import Deku.Internal.Region (ElementId(..), elementIdToString)
import Deku.Internal.Region as Region
import Deku.SSRDOMInterpret (SSRRenderingInfo(..), ssrDOMInterpret)
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Random (randomInt)
import Effect.Uncurried (runEffectFn2)
import FRP.Poll (create)
import Safe.Coerce (coerce)
import Web.DOM as Web.DOM
import Web.DOM.Document (createElement, createTextNode)
import Web.DOM.Element (setAttribute, toParentNode)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body, toDocument)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

isLively :: SSRRenderingInfo -> Boolean
isLively (SSRRenderingInfo value) = value.hasParentThatWouldDisqualifyFromSSR
  || value.hasChildrenThatWouldDisqualifyFromSSR
  || (not $ Set.isEmpty value.attributeIndicesThatAreNeededDuringHydration)

produceIsBoring
  :: Map.Map ParentId (List ChildId)
  -> Map.Map ElementId SSRRenderingInfo
  -> Map.Map ChildId ParentId
  -> Map.Map ElementId Boolean
produceIsBoring parentToChildren parentToRI childToParent =
  moveThroughBoringList
    (Set.toUnfoldable $ Set.union notInObject childless)
    Map.empty
  where
  allChildren :: Set.Set ElementId
  allChildren = Set.fromFoldable
    ((coerce :: _ -> List _) (join (Map.values parentToChildren)))

  allParents :: Set.Set ElementId
  allParents = Set.fromFoldable
    ((coerce :: _ -> List _) (Map.values childToParent))

  notInObject :: Set.Set ElementId
  notInObject = Set.difference allChildren allParents

  childless :: Set.Set ElementId
  childless = foldlWithIndex
    (\i b a -> if List.null a then (Set.insert (coerce i) b) else b)
    Set.empty
    parentToChildren

  moveThroughBoringList
    :: List ElementId -> Map.Map ElementId Boolean -> Map.Map ElementId Boolean
  moveThroughBoringList List.Nil isBoring = isBoring
  moveThroughBoringList (List.Cons h rest) isBoring = do
    let kids = fromMaybe List.Nil $ Map.lookup (coerce h) parentToChildren
    let
      kidsAreBoring = List.all
        (\k -> fromMaybe true $ Map.lookup (coerce k) isBoring)
        kids
    let
      iAmBoring = case Map.lookup h (coerce parentToRI) of
        Nothing -> true
        Just value -> not (isLively value)
    let myParentIs = Map.lookup (coerce h) childToParent
    moveThroughBoringList
      ((maybe identity (flip List.snoc) (coerce myParentIs)) rest)
      (Map.insert h (iAmBoring && kidsAreBoring) isBoring)

makeTagger :: STRef Global Int -> ST.ST Global Int
makeTagger tagRef = do
  tag <- ST.read tagRef
  void $ ST.write (tag + 1) tagRef
  pure tag

-- | Runs a deku application in a DOM element, returning a canceler that can
-- | be used to cancel the application.
runInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
runInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  let taggerStart = 0
  tagRef <- liftST $ ST.new $ taggerStart + 1
  let tagger = makeTagger tagRef
  region <- liftST $ runSTFn3 Region.fromParent (ElementId taggerStart) (Just 1)
    (DekuParent $ toDekuElement elt)
  scope <- liftST $ runSTFn3 newPSR false lifecycle region
  void $ runEffectFn2 nut scope ( fullDOMInterpret tagger)
  pure $ dispose unit

doInBody :: forall i o. (Web.DOM.Element -> i -> Effect o) -> i -> Effect o
doInBody f elt = do
  b' <- window >>= document >>= body
  maybe (throwException (error "Could not find element"))
    (flip f elt)
    (toElement <$> b')

-- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody
  :: Nut
  -> Effect (Effect Unit)
runInBody = doInBody runInElement

foreign import innerHTML :: Web.DOM.Element -> Effect String

foreign import transformTextNodes :: Web.DOM.Element -> String -> Effect Unit

foreign import mapIdsToTextNodes
  :: Web.DOM.Element -> Effect (Array { k :: ElementId, v :: Web.DOM.Text })

fixParents
  :: Map.Map ParentId (List ChildId)
  -> Map.Map ElementId SSRRenderingInfo
  -> Map.Map ElementId SSRRenderingInfo
fixParents parentInfo renderingInfo =
  (foldlWithIndex go { flipped: Set.empty, final: renderingInfo } renderingInfo).final

  where
  go
    eltId
    { flipped, final }
    s@(SSRRenderingInfo { hasChildrenThatWouldDisqualifyFromSSR: false }) =
    { flipped, final: Map.alter (\i -> i <|> Just s) eltId final }
  go
    eltId
    { flipped, final }
    _ = imputeAllChildren
    (fromMaybe List.Nil $ Map.lookup (coerce eltId) parentInfo)
    { flipped, final }
  imputeAllChildren List.Nil { flipped, final } = { flipped, final }
  imputeAllChildren (List.Cons h rest) { flipped, final }
    | Set.member ((coerce :: _ -> ElementId) h) flipped = imputeAllChildren rest { flipped, final }
    | otherwise = imputeAllChildren
        (rest <> (fromMaybe List.Nil $ Map.lookup (coerce h) parentInfo))
        { flipped: Set.insert (coerce h) flipped
        , final: Map.alter
            ( \i -> map
                ( over SSRRenderingInfo _
                    { hasParentThatWouldDisqualifyFromSSR = true }

                )
                (i <|> Map.lookup (coerce h) renderingInfo)
            )
            (coerce h)
            final
        }

type SSROutput = { html::String,cache :: Map.Map ElementId HydrationRenderingInfo }

ssrInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect SSROutput
ssrInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  let taggerStart = 0
  tagRef <- liftST $ ST.new $ taggerStart + 1
  let tagger = makeTagger tagRef
  region <- liftST $ runSTFn3 Region.fromParent (ElementId taggerStart) (Just 1)
    (DekuParent $ toDekuElement elt)
  parentCache <- liftST $ ST.new Map.empty
  regionCache <- liftST $ ST.new Map.empty
  rn0 <- randomInt 0 10000
  rn1 <- randomInt 0 10000
  rn2 <- randomInt 0 10000
  let dynTextTag = show rn0 <> "_" <> show rn1 <> "_" <> show rn2
  -- liftST $ runSTFn3 addElementToCache taggerStart regionCache elt
  scope <- liftST $ runSTFn3 newPSR false lifecycle region

  void $ runEffectFn2 nut scope
    (ssrDOMInterpret tagger dynTextTag parentCache regionCache)
  unfrozenParentCache <- liftST $ ST.read parentCache
  unfrozenRegionCache' <- liftST $ ST.read regionCache
  let unfrozenRegionCache = fixParents unfrozenParentCache unfrozenRegionCache'
  forWithIndex_ unfrozenRegionCache \tag value -> do
    for_ (un SSRRenderingInfo value).backingElement \element -> do
      when (isLively value)
        do
          setAttribute "data-deku-ssr" (elementIdToString tag) element
  let ibab i b a = Map.union (Map.fromFoldable $ map (flip Tuple i) a) b
  let reverseParentCache = foldlWithIndex ibab Map.empty unfrozenParentCache
  let
    isBoring = produceIsBoring unfrozenParentCache unfrozenRegionCache
      reverseParentCache
  let
    hydrationRenderingCache = unfrozenRegionCache # mapWithIndex
      \k (SSRRenderingInfo v) -> HydrationRenderingInfo
        { attributeIndicesThatAreNeededDuringHydration:
            v.attributeIndicesThatAreNeededDuringHydration
        , hasParentThatWouldDisqualifyFromSSR:
            v.hasParentThatWouldDisqualifyFromSSR
        , hasChildrenThatWouldDisqualifyFromSSR:
            v.hasChildrenThatWouldDisqualifyFromSSR
        , isBoring: fromMaybe false $ Map.lookup k isBoring
        }
  transformTextNodes elt dynTextTag
  htmlString <- innerHTML elt
  dispose unit
  pure $   {html:htmlString,cache:hydrationRenderingCache}

ssrInBody
  :: Nut
  -> Effect  {html:: String,cache :: Map.Map ElementId HydrationRenderingInfo}
ssrInBody = doInBody ssrInElement

hydrateInElement
  :: forall r. {cache :: Map.Map ElementId HydrationRenderingInfo | r}
  -> Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
hydrateInElement {cache} elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  let taggerStart = 0
  tagRef <- liftST $ ST.new $ taggerStart + 1
  let tagger = makeTagger tagRef
  region <- liftST $ runSTFn3 Region.fromParent (ElementId taggerStart) (Just 1)
    (DekuParent $ toDekuElement elt)
  doc <- window >>= document
  dummyElt <- createElement "div" (toDocument doc)
  dummyText <- createTextNode "dummy" (toDocument doc)
  let par = toParentNode elt
  textNodes <- Map.fromFoldable <<< map (\{ k, v } -> k /\ v) <$>
    mapIdsToTextNodes elt
  scope <- liftST $ runSTFn3 newPSR false lifecycle region
  void $ runEffectFn2 nut scope
    (hydratingDOMInterpret tagger cache textNodes dummyText dummyElt par)
  pure $ dispose unit

hydrateInBody
  :: forall r. {cache::Map.Map ElementId HydrationRenderingInfo|r}
  -> Nut
  -> Effect (Effect Unit)
hydrateInBody = doInBody <<< hydrateInElement
