-- | This module contains various helper functions for setting listeners on elements.
-- |
-- | Listeners are usually of type `Effect Unit` but can also be of type `Effect Boolean`
-- | and `DOM.Event -> Effect Boolean`. This comes from the constraint
-- | `Attr element D.MyListener cb`, where `cb` will be whatever listener is permissable.
module Deku.Listeners
  ( slider
  , numeric
  , checkbox
  , click
  , keyUp
  , keyDown
  , keyPress
  , textInput
  , injectElement
  , injectElementT
  , class Applier
  , applier
  ) where

import Prelude

import Data.Foldable (for_)
import Data.NonEmpty (NonEmpty)
import Deku.Attribute (class Attr, Attribute, Cb, attr, cb, (:=))
import Deku.DOM as D
import Effect (Effect)
import Effect.Aff (launchAff_, delay, Milliseconds(..))
import Effect.Class (liftEffect)
import FRP.Event (Event)
import Web.DOM (Element)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (checked, fromEventTarget, value, valueAsNumber)
import Web.UIEvent.KeyboardEvent (KeyboardEvent, fromEvent)

-- | Set a `click` listener for an element using an event emitting listeners.
-- | Each `click` listener emitted replaces the previous `click` listener.
click
  :: forall cb element
   . Attr element D.OnClick cb
  => cb
  -> Attribute element
click = attr D.OnClick

class Applier a b | a -> b where
  applier :: a -> b

instance Applier (Event a) ((a -> b) -> Event a -> Event b) where
  applier _ = map
else instance Applier (NonEmpty Event a) ((a -> b) -> NonEmpty Event a -> NonEmpty Event b) where
  applier _ = map
else instance Applier a ((a -> b) -> a -> b) where
  applier _ = identity

-- | Sets a `slider` listener for an element using an event emitting listeners.
-- | Each `slider` listener emitted replaces the previous `slider` listener.
slider
  :: forall e261 b269 a270 b274
   . Attr e261 D.Xtype String
  => Attr e261 D.OnInput b269
  => Applier a270 (((Number -> Effect b274) -> Cb) -> a270 -> b269)
  => a270
  -> Array (Attribute e261)
slider i = [ D.Xtype := "range" ] <>
  [ attr D.OnInput $ (applier i)
      ( \push ->
          cb \e -> for_
            (target e >>= fromEventTarget)
            (valueAsNumber >=> push)
      )
      i
  ]

-- | Sets a numeric `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
numeric
  :: forall e134 b142 a143 b147
   . Attr e134 D.Xtype String
  => Attr e134 D.OnInput b142
  => Applier a143 (((Number -> Effect b147) -> Cb) -> a143 -> b142)
  => a143
  -> Array (Attribute e134)
numeric i = [ D.Xtype := "numeric" ] <>
  [ attr D.OnInput $ (applier i)
      ( \push ->
          cb \e -> for_
            (target e >>= fromEventTarget)
            (valueAsNumber >=> push)
      )
      i
  ]

-- | Sets a `checkbox` listener for an element using an event emitting listeners.
-- | Each `checkbox` listener emitted replaces the previous `checkbox` listener.
checkbox
  :: forall e71 b79 a80 b84
   . Attr e71 D.Xtype String
  => Attr e71 D.OnInput b79
  => Applier a80 (((Boolean -> Effect b84) -> Cb) -> a80 -> b79)
  => a80
  -> Array (Attribute e71)
checkbox i = [ D.Xtype := "checkbox" ] <>
  [ attr D.OnInput $ (applier i)
      ( \push ->
          cb \e -> for_
            (target e >>= fromEventTarget)
            (checked >=> push)
      )
      i
  ]

-- | Sets a text-based `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
textInput
  :: forall e193 b195 a196 b200
   . Attr e193 D.OnInput b195
  => Applier a196 (((String -> Effect b200) -> Cb) -> a196 -> b195)
  => a196
  -> Attribute e193
textInput ev = attr D.OnInput $ (applier ev)
  ( \push -> cb \e -> for_
      (target e >>= fromEventTarget)
      (value >=> push)
  )
  ev

keyEvent'
  :: forall e101 a102 b103 a104 b108
   . Attr e101 a102 b103
  => Applier a104 (((KeyboardEvent -> Effect b108) -> Cb) -> a104 -> b103)
  => a102
  -> a104
  -> Attribute e101
keyEvent' listener ev = attr listener $ (applier ev)
  (\f -> cb \e -> for_ (fromEvent e) f)
  ev

-- | Sets a `keyup` listener for an element using an event emitting listeners.
-- | Each `keyup` listener emitted replaces the previous `keyup` listener.
keyUp
  :: forall e101126 b103128 a104129 b108130
   . Attr e101126 D.OnKeyup b103128
  => Applier a104129
       (((KeyboardEvent -> Effect b108130) -> Cb) -> a104129 -> b103128)
  => a104129
  -> Attribute e101126
keyUp = keyEvent' D.OnKeyup

-- | Sets a `keydown` listener for an element using an event emitting listeners.
-- | Each `keydown` listener emitted replaces the previous `keydown` listener.
keyDown
  :: forall e101114 b103116 a104117 b108118
   . Attr e101114 D.OnKeydown b103116
  => Applier a104117
       (((KeyboardEvent -> Effect b108118) -> Cb) -> a104117 -> b103116)
  => a104117
  -> Attribute e101114
keyDown = keyEvent' D.OnKeydown

-- | Sets a `keypress` listener for an element using an event emitting listeners.
-- | Each `keypress` listener emitted replaces the previous `keypress` listener.
keyPress
  :: forall e101120 b103122 a104123 b108124
   . Attr e101120 D.OnKeypress b103122
  => Applier a104123
       (((KeyboardEvent -> Effect b108124) -> Cb) -> a104123 -> b103122)
  => a104123
  -> Attribute e101120
keyPress = keyEvent' D.OnKeypress

-- | Sets a listener that injects a primitive DOM element into a closed scope immediately after element creation.
-- | Importantly, this does _not happen_ on the same tick as the element creation but rather during the next DOM tick.
-- | This is to guarantee that element creation happens before trying to use the element.
-- | In practice this delay will be on the order of microseconds but it can veer into milliseconds if
-- | the UI thread is particularly busy.
injectElement
  :: forall e
   . Attr e D.Self (Element -> Effect Unit)
  => (Element -> Effect Unit)
  -> Attribute e
injectElement f = D.Self := \s -> launchAff_
  (delay (Milliseconds 0.0) *> liftEffect (f s))

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall e te
   . Attr e D.SelfT (te -> Effect Unit)
  => (te -> Effect Unit)
  -> Attribute e
injectElementT f = D.SelfT := \s -> launchAff_
  (delay (Milliseconds 0.0) *> liftEffect (f s))