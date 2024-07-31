module Deku.Interpret where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Array.ST as STArray
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (for_, traverse_)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..), fromJust, fromMaybe, isJust)
import Data.Nullable (toMaybe)
import Deku.Core as Core
import Deku.Internal.Entities (DekuChild(..), DekuElement, DekuParent(..), fromDekuElement, fromDekuText, toDekuElement, toDekuText)
import Deku.Internal.Region (Anchor(..))
import Deku.UnsafeDOM (addEventListener, after, createDocumentFragment, createElement, createElementNS, createText, eventListener, popCb, prepend, pushCb, removeEventListener, setTextContent)
import Effect (Effect, whileE)
import Effect.Ref as Ref
import Effect.Uncurried (EffectFn2, EffectFn3, mkEffectFn1, mkEffectFn2, mkEffectFn3, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Partial.Unsafe (unsafePartial)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)
import Web.DOM (ChildNode, Element, Node)
import Web.DOM.ChildNode (remove)
import Web.DOM.Element (removeAttribute, setAttribute)
import Web.DOM.Node (firstChild, nextSibling)
import Web.DOM.Text as Text
import Web.Event.Event (EventType(..))
import Web.Event.Event as Web
import Web.Event.Internal.Types (EventTarget)
import Web.HTML.HTMLButtonElement as HTMLButtonElement
import Web.HTML.HTMLFieldSetElement as HTMLFieldSetElement
import Web.HTML.HTMLInputElement as HTMLInputElement
import Web.HTML.HTMLKeygenElement as HTMLKeygenElement
import Web.HTML.HTMLLinkElement as HTMLLinkElement
import Web.HTML.HTMLOptGroupElement as HTMLOptGroupElement
import Web.HTML.HTMLOptionElement as HTMLOptionElement
import Web.HTML.HTMLSelectElement as HTMLSelectElement
import Web.HTML.HTMLTextAreaElement as HTMLTextAreaElement

makeElementEffect :: Core.MakeElement
makeElementEffect = mkEffectFn3 \_ ns tag -> do
  elt <- case coerce ns :: Maybe String of
    Nothing -> runEffectFn1 createElement (coerce tag)
    Just ns' -> runEffectFn2 createElementNS (coerce ns') (coerce tag)
  pure $ toDekuElement elt

attachElementEffect :: Core.AttachElement
attachElementEffect =
  mkEffectFn2 \(DekuChild el) -> runEffectFn2 attachNodeEffect
    [ fromDekuElement @Node el ]

setPropEffect :: Core.SetProp
setPropEffect = mkEffectFn3 \(Core.Key k) (Core.Value v) elt' -> do
  let elt = fromDekuElement elt'
  let
    o
      | k == "value"
      , Just ie <- HTMLInputElement.fromElement elt = HTMLInputElement.setValue
          v
          ie
      | k == "value"
      , Just tx <- HTMLTextAreaElement.fromElement elt =
          HTMLTextAreaElement.setValue v tx
      | k == "checked"
      , Just ie <- HTMLInputElement.fromElement elt =
          HTMLInputElement.setChecked (v == "true") ie
      | k == "disabled"
      , Just fe <-
          getDisableable elt disableables = runExists
          (\(FeO { f, e }) -> f (v == "true") e)
          fe
      | otherwise = setAttribute k v elt
  o

setCbEffect :: Core.SetCb
setCbEffect = mkEffectFn3 \(Core.Key k) (Core.Cb v) elt' -> do
  if k == "@self@" then do
    void $ v ((unsafeCoerce :: DekuElement -> Web.Event) elt')
  else do
    let asElt = fromDekuElement @Element elt'
    l <- runEffectFn2 popCb k asElt
    let eventType = EventType k
    let eventTarget = fromDekuElement @EventTarget elt'
    for_ (toMaybe l) \toRemove -> runEffectFn4 removeEventListener eventType
      toRemove
      false
      eventTarget
    nl <- runEffectFn1 eventListener $ mkEffectFn1 v
    runEffectFn4 addEventListener eventType nl false eventTarget
    runEffectFn3 pushCb k nl asElt

unsetAttributeEffect :: Core.UnsetAttribute
unsetAttributeEffect = mkEffectFn2 \(Core.Key k) elt' -> do
  let asElt = fromDekuElement @Element elt'
  l <- runEffectFn2 popCb k asElt
  let asEventTarget = fromDekuElement @EventTarget elt'
  let eventType = EventType k
  for_ (toMaybe l) \toRemove -> do
    runEffectFn4 removeEventListener eventType toRemove false asEventTarget
  removeAttribute k asElt

removeElementEffect :: Core.RemoveElement
removeElementEffect = mkEffectFn1 \e -> do
  remove (fromDekuElement @ChildNode e)

newtype FeI e = FeI
  { f :: Boolean -> e -> Effect Unit, e :: Element -> Maybe e }

newtype FeO e = FeO { f :: Boolean -> e -> Effect Unit, e :: e }

disableables ∷ List (Exists FeI)
disableables =
  mkExists
    ( FeI
        { e: HTMLButtonElement.fromElement
        , f: HTMLButtonElement.setDisabled
        }
    )
    : mkExists
        ( FeI
            { e: HTMLInputElement.fromElement
            , f: HTMLInputElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLFieldSetElement.fromElement
            , f: HTMLFieldSetElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLKeygenElement.fromElement
            , f: HTMLKeygenElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLLinkElement.fromElement
            , f: HTMLLinkElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLOptGroupElement.fromElement
            , f: HTMLOptGroupElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLOptionElement.fromElement
            , f: HTMLOptionElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLSelectElement.fromElement
            , f: HTMLSelectElement.setDisabled
            }
        )
    : mkExists
        ( FeI
            { e: HTMLTextAreaElement.fromElement
            , f: HTMLTextAreaElement.setDisabled
            }
        )
    : Nil

getDisableable :: Element -> List (Exists FeI) -> Maybe (Exists FeO)
getDisableable elt = go

  where

  go Nil = Nothing
  go (x : _)
    | Just o <-
        runExists
          (\(FeI { f, e }) -> e elt <#> \e' -> mkExists (FeO { f, e: e' }))
          x = Just o
  go (_ : y) = go y

makeTextEffect :: Core.MakeText
makeTextEffect = mkEffectFn2 \_ mstr -> do
  txt <- runEffectFn1 createText (fromMaybe "" mstr)
  pure $ toDekuText txt

attachTextEffect :: Core.AttachText
attachTextEffect =
  mkEffectFn2 \txt -> do
    runEffectFn2 attachNodeEffect [ fromDekuText @Node txt ]

setTextEffect :: Core.SetText
setTextEffect = mkEffectFn2 \str txt' -> do
  let txt = fromDekuText @Node txt'
  runEffectFn2 setTextContent str txt

removeTextEffect :: Core.RemoveText
removeTextEffect = mkEffectFn1 \t -> do
  remove (Text.toChildNode (fromDekuText t))

bufferPortal :: Core.BufferPortal
bufferPortal =
  DekuParent <<< toDekuElement <$> createDocumentFragment

-- | Uses [after](https://developer.mozilla.org/en-US/docs/Web/API/Element/after) and
-- | [prepend](https://developer.mozilla.org/en-US/docs/Web/API/Element/prepend) to efficiently move the collected
-- | nodes. To collect the `Node`s we simply iterate from the beginning(via
-- | [firstChild](https://developer.mozilla.org/en-US/docs/Web/API/Node/firstChild) or
-- | [nextSibling](https://developer.mozilla.org/en-US/docs/Web/API/Node/nextSibling)) until we find the end `Node` via
-- | referential equality.
beamRegionEffect :: Core.BeamRegion
beamRegionEffect = mkEffectFn3 case _, _, _ of
  _, ParentStart _, _ ->
    pure unit

  ParentStart (DekuParent parent), end, target -> do
    firstChild (fromDekuElement @Node parent) >>= traverse_ \first ->
      runEffectFn3 beamNodes first (toNode end) target

  fromBegin, fromEnd, target -> do
    let
      beginNode = toNode fromBegin
      endNode = toNode fromEnd

    -- if beginning equals the end, `nextSibling` would overshoot, so just check now and abort
    if unsafeRefEq beginNode endNode then
      pure unit
    else
      nextSibling beginNode >>= traverse_ \first ->
        runEffectFn3 beamNodes first endNode target

  where

  beamNodes :: EffectFn3 Node Node Anchor Unit
  beamNodes = mkEffectFn3 \first end target -> do
    acc <- liftST $ STArray.new
    next <- Ref.new $ Just first

    whileE (isJust <$> Ref.read next) do
      current <- unsafePartial $ fromJust <$> Ref.read next
      void $ liftST $ STArray.push current acc

      if unsafeRefEq current end then
        void $ Ref.write Nothing next
      else do
        nextCandidate <- nextSibling current
        void $ Ref.write nextCandidate next

    nodes <- liftST $ STArray.unsafeFreeze acc
    runEffectFn2 attachNodeEffect nodes target

  toNode :: Anchor -> Node
  toNode a = unsafePartial case a of
    Element el -> fromDekuElement @Node el
    Text txt -> fromDekuText @Node txt

attachNodeEffect :: EffectFn2 (Array Node) Anchor Unit
attachNodeEffect = mkEffectFn2 \nodes anchor -> do
  case anchor of
    ParentStart (DekuParent parent) -> do
      runEffectFn2 prepend nodes (fromDekuElement @Node parent)

    Element el -> do
      runEffectFn2 after nodes (fromDekuElement @Node el)

    Text txt -> do
      runEffectFn2 after nodes (fromDekuText @Node txt)
