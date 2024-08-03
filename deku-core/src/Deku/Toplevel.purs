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

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (runSTFn1, runSTFn3)
import Control.Monad.Writer (lift, runWriterT, tell)
import Data.Bifunctor (lmap)
import Data.Filterable (filterMap)
import Data.FoldableWithIndex (forWithIndex_)
import Data.Map as Map
import Data.Map.Internal (Map(..))
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (un)
import Data.Set as Set
import Data.String as String
import Data.Traversable (foldl, for_, sequence, traverse)
import Data.Tuple (Tuple(..), swap)
import Data.Tuple.Nested ((/\))
import Deku.Core (Nut(..), newPSR)
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.HydratingDOMInterpret (hydratingDOMInterpret)
import Deku.Internal.Ancestry (Ancestry, DekuAncestry(..), reconstructAncestry, unsafeCollectLineage)
import Deku.Internal.Ancestry as Ancestry
import Deku.Internal.Entities (DekuParent(..), fromDekuElement, fromDekuText, toDekuElement)
import Deku.Internal.Region as Region
import Deku.SSR.Optimize (hasPlainAncestry, truncateLineageBy1)
import Deku.SSRDOMInterpret (SSRElementRenderingInfo(..), SSRTextRenderingInfo(..), ssrDOMInterpret)
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Uncurried (runEffectFn2)
import FRP.Poll (create)
import Web.DOM as Web.DOM
import Web.DOM.Element (getAttribute, removeAttribute, setAttribute, toParentNode)
import Web.DOM.Element as Element
import Web.DOM.Node (nextSibling, parentNode, previousSibling, removeChild)
import Web.DOM.NodeList (toArray)
import Web.DOM.ParentNode (QuerySelector(..), querySelectorAll)
import Web.DOM.Text as Text
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

-- | Runs a deku application in a DOM element, returning a canceler that can
-- | be used to cancel the application.
runInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
runInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  region <- liftST $ runSTFn1 Region.fromParent (DekuParent $ toDekuElement elt)
  scope <- liftST $ runSTFn3 newPSR Ancestry.root lifecycle region
  void $ runEffectFn2 nut scope fullDOMInterpret
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

foreign import transformTextNode :: String -> Web.DOM.Text -> Effect Unit

foreign import mapIdsToTextNodes
  :: Web.DOM.Element -> Effect (Array { k :: String, v :: Web.DOM.Text })

type SSROutput =
  { html :: String
  , livePortals :: Set.Set Ancestry
  , boring :: Set.Set Ancestry
  }

-- we run this over all of the entries that are _not_ super safe
-- in order to be super-duper safe, something can't be an ancestor of
-- something that's unsafe, even if _it_ is safe
-- for example, there could be a D.div that is completely safe but
-- deep down in the tree in contains a dyn
-- this will mark it as unsafe
ancestryNotPresentIn :: DekuAncestry -> Set.Set DekuAncestry -> Boolean
ancestryNotPresentIn needle haystack = any (Set.toMap haystack)
  where
  ff (Element i a) (Element j b)
    | i == j = ff a b
    | otherwise = false
  ff (Fixed i a) (Fixed j b)
    | i == j = ff a b
    | otherwise = false
  ff (Portal i a) (Portal j b)
    | i == j = ff a b
    | otherwise = false
  ff (Dyn i a) (Dyn j b)
    | i == j = ff a b
    | otherwise = false
  ff Root Root = true
  ff _ _ = false
  -- f returns true if the ancestry is present and false otherwise
  f a@(Element _ r) = ff needle a || f r
  f a@(Fixed _ r) = ff needle a || f r
  f a@(Dyn _ r) = ff needle a || f r
  f a@(Portal _ r) = ff needle a || f r
  f Root = ff needle Root
  any = case _ of
    Leaf -> true
    -- f guarantees that the ancestry is not present
    -- so if it is false, it terminates early
    Node _ _ mk _ ml mr -> not f mk && any ml && any mr

ssrInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect SSROutput
ssrInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  textCacheRef <- liftST $ ST.new Map.empty
  elementCacheRef <- liftST $ ST.new Map.empty
  purePortalsRef <- liftST $ ST.new Set.empty
  portalCacheRef <- liftST $ ST.new Set.empty
  dynCacheRef <- liftST $ ST.new Set.empty
  fixedCacheRef <- liftST $ ST.new Set.empty
  portalCtrRef <- liftST $ ST.new (-1)
  let
    di = ssrDOMInterpret portalCtrRef textCacheRef elementCacheRef
      purePortalsRef
      portalCacheRef
      dynCacheRef
      fixedCacheRef
  region <- liftST $ runSTFn1 Region.fromParent (DekuParent $ toDekuElement elt)
  scope <- liftST $ runSTFn3 newPSR
    Ancestry.root
    lifecycle
    region

  void $ runEffectFn2 nut scope di
  elementCache <- liftST $ ST.read elementCacheRef
  textCache <- liftST $ ST.read textCacheRef
  forWithIndex_ elementCache \tag value -> do
    setAttribute "data-deku-ssr" (Ancestry.toStringRepresentationInDOM tag) $
      fromDekuElement (un SSRElementRenderingInfo value).backingElement
  forWithIndex_ textCache \tag value -> do
    transformTextNode (Ancestry.toStringRepresentationInDOM tag) $ fromDekuText
      (un SSRTextRenderingInfo value).backingText
  let
    setMapOpPar = Set.fromFoldable
      <<< filterMap (unsafeCollectLineage >=> truncateLineageBy1)
      <<< (Set.toUnfoldable :: _ -> Array _)
    setMapOp = Set.fromFoldable
      <<< filterMap unsafeCollectLineage
      <<< (Set.toUnfoldable :: _ -> Array _)
  --
  allParDynAncestry <- setMapOpPar <$> (liftST $ ST.read dynCacheRef)
  allParPortalAncestry <- setMapOpPar <$> (liftST $ ST.read portalCacheRef)
  allParFixedAncestry <- setMapOpPar <$> (liftST $ ST.read fixedCacheRef)
  --
  allDynAncestry <- setMapOp <$> (liftST $ ST.read dynCacheRef)
  allPortalAncestry <- setMapOp <$> (liftST $ ST.read portalCacheRef)
  allFixedAncestry <- setMapOp <$> (liftST $ ST.read fixedCacheRef)
  --
  let
    allDynamicEntries = allDynAncestry <> allPortalAncestry <> allFixedAncestry
    allDekuEltAndTextAncestries =
      foldl (\b a -> maybe b (flip Set.insert b) $ unsafeCollectLineage a)
        Set.empty $ Map.keys textCache <> Map.keys elementCache
    safeEntries = Set.filter
      ( hasPlainAncestry
          (allParDynAncestry <> allParPortalAncestry <> allParFixedAncestry)
          allDynamicEntries
      )
      allDekuEltAndTextAncestries
    elementCache' = Map.fromFoldable $ filterMap
      (lmap unsafeCollectLineage >>> swap >>> sequence >>> map swap)
      (Map.toUnfoldable elementCache :: Array _)
    textCache' = Map.fromFoldable $ filterMap
      (lmap unsafeCollectLineage >>> swap >>> sequence >>> map swap)
      (Map.toUnfoldable textCache :: Array _)
  Tuple _ superSafeEntries <- map (map Set.fromFoldable) $ runWriterT $ for_
    safeEntries
    \se -> do
      for_ (Map.lookup se elementCache')
        \(SSRElementRenderingInfo { isImpure, backingElement }) ->
          when (not isImpure) do
            tell [ se ]
            lift do
              removeAttribute "data-deku-ssr" $ fromDekuElement backingElement
      for_ (Map.lookup se textCache')
        \(SSRTextRenderingInfo { backingText, isImpure }) ->
          when (not isImpure) do
            tell [ se ]
            lift do
              let tn = Text.toNode $ fromDekuText backingText
              prevComment <- previousSibling tn
              nextComment <- nextSibling tn
              for_ prevComment \pc ->
                for_ nextComment \nc -> do
                  par <- parentNode pc
                  for_ par \p -> do
                    removeChild pc p
                    removeChild nc p
  let
    superDuperSafeEntries = Set.filter
      ( flip ancestryNotPresentIn
          ( Set.difference (allDekuEltAndTextAncestries <> allDynamicEntries)
              superSafeEntries
          )
      )
      superSafeEntries
    boring = Set.filter
      ( maybe true (not $ flip Set.member superDuperSafeEntries) <<<
          truncateLineageBy1
      )
      superDuperSafeEntries
  htmlString <- innerHTML elt
  dispose unit
  livePortals <- liftST $ ST.read purePortalsRef
  pure $
    { html: String.replace (String.Pattern "data-deku-value")
        (String.Replacement "value")
        htmlString
    , livePortals
    , boring: Set.map reconstructAncestry boring
    }

ssrInBody
  :: Nut
  -> Effect SSROutput
ssrInBody = doInBody ssrInElement

hydrateInElement
  :: forall r
   . { livePortals :: Set.Set Ancestry
     , boring :: Set.Set Ancestry
     | r
     }
  -> Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
hydrateInElement { livePortals, boring } ielt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  portalCtrRef <- liftST $ ST.new (-1)
  region <- liftST $ runSTFn1 Region.fromParent
    (DekuParent $ toDekuElement ielt)
  nodes <-
    querySelectorAll (QuerySelector "[data-deku-ssr]") (toParentNode ielt)
      >>= toArray
  kv <- nodes # traverse \node -> do
    case Element.fromNode node of
      Nothing -> throwException (error "Could not convert node to element")
      Just elt -> do
        attr <- getAttribute "data-deku-ssr" elt
        case attr of
          Nothing -> throwException (error "Could not get ssr rep")
          Just k -> pure $ Tuple (Ancestry.unsafeFakeAncestry k) elt
  textNodes <-
    Map.fromFoldable <<< map (\{ k, v } -> Ancestry.unsafeFakeAncestry k /\ v)
      <$>
        mapIdsToTextNodes ielt
  scope <- liftST $ runSTFn3 newPSR Ancestry.root lifecycle region
  void $ runEffectFn2 nut scope
    ( hydratingDOMInterpret boring portalCtrRef (Map.fromFoldable kv) textNodes
        livePortals
    )
  pure $ dispose unit

hydrateInBody
  :: forall r
   . { livePortals :: Set.Set Ancestry
     , boring :: Set.Set Ancestry
     | r
     }
  -> Nut
  -> Effect (Effect Unit)
hydrateInBody = doInBody <<< hydrateInElement
