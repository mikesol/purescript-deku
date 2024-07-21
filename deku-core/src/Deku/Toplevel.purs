-- | These functions are used to run a Deku application.
module Deku.Toplevel (runInElement, runInBody, ssrInElement) where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (STRef)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (runSTFn3)
import Data.Array as Array
import Data.Foldable (for_)
import Data.FoldableWithIndex (foldlWithIndex, forWithIndex_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Tuple (Tuple(..))
import Deku.Core (Nut(..), PSR(..))
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.HydratingDOMInterpret (HydrationRenderingInfo(..))
import Deku.Internal.Entities (DekuParent(..), toDekuElement)
import Deku.Internal.Region as Region
import Deku.SSRDOMInterpret (SSRRenderingInfo(..), ssrDOMInterpret)
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Uncurried (runEffectFn2)
import FRP.Poll (create)
import Foreign.Object (Object)
import Foreign.Object as Object
import Foreign.Object.ST as STObject
import Foreign.Object.ST.Unsafe (unsafeFreeze)
import Web.DOM.Element (setAttribute)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

produceIsBoring
  :: Object (Array String)
  -> Object SSRRenderingInfo
  -> Object String
  -> Object Boolean
produceIsBoring parentToChildren parentToRI childToParent =
  moveThroughBoringArray childless Object.empty
  where
  childless = join $ Object.values $ Object.filter Array.null parentToChildren
  moveThroughBoringArray boringArray isBoring = case Array.head boringArray of
    Nothing -> isBoring
    Just h -> do
      let kids = fromMaybe [] $ Object.lookup h parentToChildren
      let
        kidsAreBoring = Array.all
          (\k -> fromMaybe false $ Object.lookup k isBoring)
          kids
      let
        iAmBoring = case Object.lookup h parentToRI of
          Nothing -> false
          Just (SSRRenderingInfo value) -> not
            ( value.hasParentThatWouldDisqualifyFromSSR
                || value.hasChildrenThatWouldDisqualifyFromSSR
                || value.attributeIndicesThatAreNeededDuringHydration /= Nothing
            )
      let myParentIs = Object.lookup h childToParent
      moveThroughBoringArray
        (maybe boringArray (Array.snoc (Array.drop 1 boringArray)) myParentIs)
        (Object.insert h (iAmBoring && kidsAreBoring) isBoring)

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
  region <- liftST $ runSTFn3 Region.fromParent taggerStart Nothing
    (DekuParent $ toDekuElement elt)
  void $ runEffectFn2 nut
    ( PSR
        { region, disqualifyFromStaticRendering: false, unsubs: [], lifecycle }
    )
    (fullDOMInterpret tagger)
  pure $ dispose unit

-- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody
  :: Nut
  -> Effect (Effect Unit)
runInBody elt = do
  b' <- window >>= document >>= body
  maybe (throwException (error "Could not find element"))
    (flip runInElement elt)
    (toElement <$> b')

foreign import innerHTML :: Web.DOM.Element -> Effect String

ssrInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect (Tuple String (Object HydrationRenderingInfo))
ssrInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  let taggerStart = 0
  tagRef <- liftST $ ST.new $ taggerStart + 1
  let tagger = makeTagger tagRef
  region <- liftST $ runSTFn3 Region.fromParent taggerStart Nothing
    (DekuParent $ toDekuElement elt)
  parentCache <- liftST $ STObject.new
  regionCache <- liftST $ STObject.new
  void $ runEffectFn2 nut
    ( PSR
        { region, disqualifyFromStaticRendering: false, unsubs: [], lifecycle }
    )
    (ssrDOMInterpret tagger parentCache regionCache)
  unfrozenParentCache <- liftST $ unsafeFreeze parentCache
  unfrozenRegionCache <- liftST $ unsafeFreeze regionCache
  forWithIndex_ unfrozenRegionCache \tag (SSRRenderingInfo value) -> do
    for_ value.backingElement \element -> do
      when
        ( value.hasParentThatWouldDisqualifyFromSSR
            || value.hasChildrenThatWouldDisqualifyFromSSR
            || value.attributeIndicesThatAreNeededDuringHydration /= Nothing
        )
        do
          setAttribute "data-deku-ssr" tag element
  let ibab i b a = Object.union (Object.fromFoldable $ map (flip Tuple i) a) b
  let reverseParentCache = foldlWithIndex ibab Object.empty unfrozenParentCache
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
        , isBoring: fromMaybe false $ Object.lookup k isBoring
        }
  htmlString <- innerHTML elt
  dispose unit
  pure $ Tuple htmlString hydrationRenderingCache
