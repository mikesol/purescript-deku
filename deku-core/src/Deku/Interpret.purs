-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST, liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as Ref
import Data.Array as Array
import Data.Array.ST (STArray)
import Data.Foldable (for_)
import Data.List ((:))
import Data.List as List
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Monoid.Endo (Endo(..))
import Data.Newtype (unwrap)
import Data.Nullable (toMaybe)
import Data.String.Utils (includes)
import Data.Traversable (traverse)
import Deku.Core (DekuBeacon, DekuChild(..), DekuElement, DekuText)
import Deku.Core as Core
import Deku.JSMap (JSMap)
import Deku.JSUtil (unsafeFragmentToElement, unsafeNodeToFragment)
import Deku.JSWeakRef (WeakRef, deref, weakRef)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1, mkEffectFn2, mkEffectFn4, runEffectFn1)
import FRP.Event (create, subscribe)
import FRP.Poll (sample)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Untagged.Union (type (|+|))
import Web.DOM (Comment, Element, Text)
import Web.DOM.Comment as Comment
import Web.DOM.Document (createDocumentFragment, createElementNS)
import Web.DOM.Node (nodeType, nodeTypeIndex, parentNode)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window (document)

type MapEntry = WeakRef DekuElement |+| WeakRef DekuBeacon |+| WeakRef DekuText

toDekuElement :: Element -> DekuElement
toDekuElement = unsafeCoerce

fromDekuElement :: DekuElement -> Element
fromDekuElement = unsafeCoerce

toDekuBeacon :: Comment -> DekuBeacon
toDekuBeacon = unsafeCoerce

fromDekuBeacon :: DekuBeacon -> Comment
fromDekuBeacon = unsafeCoerce

toDekuText :: Text -> DekuText
toDekuText = unsafeCoerce

fromDekuText :: DekuText -> Text
fromDekuText = unsafeCoerce

type UnsubscribeMap = JSMap MapEntry (STArray Global (Effect Unit))

makeElementEffect :: UnsubscribeMap -> Core.MakeElement
makeElementEffect jsMap = mkEffectFn2 \ns tag -> do
  doc <- window >>= document
  elt <- createElementNS (coerce ns) (coerce tag) (toDocument doc)
  wr <- runEffectFn1 weakRef elt
  pure $ toDekuElement elt

getFragmentParentEffect :: Core.GetFragmentParent
getFragmentParentEffect = mkEffectFn1 \beacon' -> do
  let beacon = fromDekuBeacon beacon'
  parent' <- parentNode (Comment.toNode beacon)
  case parent' of
    Just parent
      | nodeTypeIndex parent == 11 -> do
          pure $ Just $ toDekuElement $ unsafeFragmentToElement $
            unsafeNodeToFragment parent
    _ -> pure Nothing

makeFragmentEffect :: Core.MakeFragment
makeFragmentEffect = do
  doc <- window >>= document
  df <- createDocumentFragment $ toDocument doc
  pure $ toDekuElement $ unsafeFragmentToElement df

-- attributeDynParentForElement :: Core.AttributeDynParentForElement
-- attributeDynParentForElement = mkEffectFn4 \(DekuChild child) start end mpos -> do
--   case mpos of
--     Just pos ->
--     Nothing -> insertBefore child end

-- insertBefore :: Node -> Node -> Node -> Effect Unit
-- Inserts the first node before the second as a child of the third node.

fullDOMInterpret
  :: UnsubscribeMap
  -> Core.DOMInterpret
fullDOMInterpret jsMap = Core.DOMInterpret
  { makeElement: makeElementEffect jsMap
  , getFragmentParent: getFragmentParentEffect
  , makeFragment: makeFragmentEffect
  }