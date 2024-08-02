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
import Control.Plus (empty)
import Data.FoldableWithIndex (foldlWithIndex, forWithIndex_)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (un)
import Data.Set as Set
import Data.String as String
import Data.Traversable (traverse)
import Data.Tuple.Nested ((/\))
import Deku.Core (Nut(..), newPSR)
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.HydratingDOMInterpret (HydrationRenderingInfo(..), hydratingDOMInterpret)
import Deku.Internal.Ancestry (Ancestry)
import Deku.Internal.Ancestry as Ancestry
import Deku.Internal.Entities (DekuParent(..), fromDekuElement, fromDekuText, toDekuElement)
import Deku.Internal.Region as Region
import Deku.SSRDOMInterpret (SSRElementRenderingInfo(..), SSRTextRenderingInfo(..), SerializableSSRRenderingInfo(..), ssrDOMInterpret)
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Uncurried (runEffectFn2)
import FRP.Poll (create)
import Web.DOM as Web.DOM
import Web.DOM.Element (getAttribute, setAttribute, toParentNode)
import Web.DOM.Element as Element
import Web.DOM.NodeList (toArray)
import Web.DOM.ParentNode (QuerySelector(..), querySelectorAll)
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
  , cache :: Map.Map Ancestry SerializableSSRRenderingInfo
  , livePortals :: Set.Set Ancestry
  }

ssrInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect SSROutput
ssrInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  textCacheRef <- liftST $ ST.new Map.empty
  elementCacheRef <- liftST $ ST.new Map.empty
  portalsRef <- liftST $ ST.new Set.empty
  portalCtrRef <- liftST $ ST.new (-1)
  let di = ssrDOMInterpret portalCtrRef textCacheRef elementCacheRef portalsRef
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
    cache = foldlWithIndex
      ( \i b (SSRTextRenderingInfo { ancestry, isImpure }) -> Map.insert i
          (SerializableSSRTextRenderingInfo { ancestry, isImpure })
          b
      )
      ( foldlWithIndex
          ( \i
             b
             ( SSRElementRenderingInfo
                 { ancestry, isImpure }
             ) -> Map.insert i
              ( SerializableSSRElementRenderingInfo
                  { ancestry, isImpure }
              )
              b
          )
          Map.empty
          elementCache
      )
      textCache
  htmlString <- innerHTML elt
  dispose unit
  livePortals <- liftST $ ST.read portalsRef
  pure $
    { html: String.replace (String.Pattern "data-deku-value")
        (String.Replacement "value")
        htmlString
    , cache
    , livePortals
    }

ssrInBody
  :: Nut
  -> Effect SSROutput
ssrInBody = doInBody ssrInElement

hydrateInElement
  :: forall r
   . { cache :: Map.Map Ancestry SerializableSSRRenderingInfo
     , livePortals :: Set.Set Ancestry
     | r
     }
  -> Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
hydrateInElement { cache, livePortals } ielt (Nut nut) = do
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
          Just k -> pure $
            ( Ancestry.unsafeFakeAncestry k /\ HydrationRenderingInfo
                { isImpure: fromMaybe
                    false
                    do
                      cacheValue <- Map.lookup (Ancestry.unsafeFakeAncestry k)
                        cache
                      case cacheValue of
                        SerializableSSRElementRenderingInfo
                          { isImpure } ->
                          pure isImpure
                        _ -> empty
                , isBoring: false
                , backingElement: elt
                }
            )
  textNodes <-
    Map.fromFoldable <<< map (\{ k, v } -> Ancestry.unsafeFakeAncestry k /\ v)
      <$>
        mapIdsToTextNodes ielt
  scope <- liftST $ runSTFn3 newPSR Ancestry.root lifecycle region
  void $ runEffectFn2 nut scope
    ( hydratingDOMInterpret portalCtrRef (Map.fromFoldable kv) textNodes
        livePortals
    )
  pure $ dispose unit

hydrateInBody
  :: forall r
   . { cache :: Map.Map Ancestry SerializableSSRRenderingInfo
     , livePortals :: Set.Set Ancestry
     | r
     }
  -> Nut
  -> Effect (Effect Unit)
hydrateInBody = doInBody <<< hydrateInElement
