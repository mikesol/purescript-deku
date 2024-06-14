module Deku.Interpret where

import Prelude

import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (for_)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Nullable (toMaybe)
import Deku.Core as Core
import Deku.Internal.Entities (DekuChild(..), DekuElement, DekuParent(..), fromDekuElement, fromDekuText, toDekuElement, toDekuText)
import Deku.Internal.Region (BoundAnchor(..))
import Deku.UnsafeDOM (addEventListener, after, cloneElement, cloneTemplate, createElement, createElementNS, createText, eventListener, popCb, prepend, pushCb, removeEventListener, setTextContent, toTemplate)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, mkEffectFn1, mkEffectFn2, mkEffectFn3, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM (ChildNode, Element, Node)
import Web.DOM.ChildNode (remove)
import Web.DOM.Element (removeAttribute, setAttribute)
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
import Web.HTML.HTMLTemplateElement as HTMLTemplateElement
import Web.HTML.HTMLTextAreaElement as HTMLTextAreaElement


makeElementEffect :: Core.MakeElement
makeElementEffect = mkEffectFn2 \ns tag -> do
  elt <- case coerce ns :: Maybe String of
    Nothing -> runEffectFn1 createElement (coerce tag)
    Just ns' -> runEffectFn2 createElementNS ( coerce ns' ) (coerce tag)
  pure $ toDekuElement elt

attachElementEffect :: Core.AttachElement
attachElementEffect =
  mkEffectFn2 \( DekuChild el ) -> runEffectFn2 attachNodeEffect ( fromDekuElement @Node el )

setPropEffect :: Core.SetProp
setPropEffect = mkEffectFn3 \elt' (Core.Key k) (Core.Value v) -> do
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
setCbEffect = mkEffectFn3 \elt' (Core.Key k) (Core.Cb v) -> do
  if k == "@self@" then do
    void $ v  ((unsafeCoerce :: DekuElement -> Web.Event) elt')
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
unsetAttributeEffect = mkEffectFn2 \elt' (Core.Key k) -> do
  let asElt = fromDekuElement @Element elt'
  l <- runEffectFn2 popCb k asElt
  let asEventTarget = fromDekuElement @EventTarget elt'
  let eventType = EventType k
  for_ (toMaybe l) \toRemove -> do
    runEffectFn4 removeEventListener eventType toRemove false asEventTarget
  removeAttribute k asElt

removeElementEffect :: Core.RemoveElement
removeElementEffect = mkEffectFn1 \ e -> do
  remove ( fromDekuElement @ChildNode e)

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
makeTextEffect = mkEffectFn1 \mstr -> do
  txt <- runEffectFn1 createText (fromMaybe "" mstr)
  pure $ toDekuText txt

attachTextEffect :: Core.AttachText
attachTextEffect =
  mkEffectFn2 \txt -> runEffectFn2 attachNodeEffect ( fromDekuText @Node txt )

setTextEffect :: Core.SetText
setTextEffect = mkEffectFn2 \txt' str -> do
  let txt = fromDekuText @Node txt'
  runEffectFn2 setTextContent str txt

removeTextEffect :: Core.RemoveText
removeTextEffect = mkEffectFn2 \_ t -> do
  remove (Text.toChildNode (fromDekuText t))

beamRegionEffect :: Core.BeamRegion
beamRegionEffect = mkEffectFn3 \fromBegin fromEnd target -> do
  pure unit

attachNodeEffect :: EffectFn2 Node BoundAnchor Unit
attachNodeEffect = mkEffectFn2 \node -> case _ of
  ParentStart ( DekuParent parent ) -> do
    runEffectFn2 prepend node ( fromDekuElement @Node parent )

  Element el -> do
    runEffectFn2 after node ( fromDekuElement @Node el )

  Text txt -> do
    runEffectFn2 after node ( fromDekuText @Node txt )

toTemplateEffect :: Core.MakeTemplate
toTemplateEffect = toTemplate

cloneElementEffect :: Core.CloneElement
cloneElementEffect = cloneElement

cloneTemplateEffect :: Core.CloneTemplate
cloneTemplateEffect = cloneTemplate

templateContentEffect :: Core.TemplateContent
templateContentEffect = mkEffectFn1 HTMLTemplateElement.content