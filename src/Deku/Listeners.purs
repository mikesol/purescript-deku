-- | This module contains various helper functions for setting listeners on elements.
-- |
-- | Listeners are usually of type `Effect Unit` but can also be of type `Effect Boolean`
-- | and `DOM.Event -> Effect Boolean`. This comes from the constraint
-- | `Attr element D.MyListener cb`, where `cb` will be whatever listener is permissable.
module Deku.Listeners
  ( slider
  , slider_
  , numeric
  , numeric_
  , checkbox
  , checkbox_
  , click
  , click_
  , keyUp
  , keyUp_
  , keyDown
  , keyDown_
  , keyPress
  , keyPress_
  , textInput
  , textInput_
  , injectElement
  , injectElementT
  ) where

import Prelude

import Data.Foldable (for_)
import Deku.Attribute (class Attr, Attribute, Cb, cb, pureAttr, unpureAttr, (!:=))
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
  => Event cb
  -> Attribute element
click = unpureAttr D.OnClick

-- | Set a `click` listener for an element using a constant listener.
click_
  :: forall cb element
   . Attr element D.OnClick cb
  => cb
  -> Attribute element
click_ = pureAttr D.OnClick

slider' :: forall t46 e48 a52 b57. Attr e48 D.Xtype String => (D.OnInput -> a52 -> Attribute e48) -> (((Number -> Effect b57) -> Cb) -> t46 -> a52) -> t46 -> Array (Attribute e48)
slider' f1 f2 i = [ D.Xtype !:= "range" ] <>
  [ f1 D.OnInput $ f2
      ( \push ->
          cb \e -> for_
            (target e >>= fromEventTarget)
            (valueAsNumber >=> push)
      )
      i
  ]

-- | Sets a `slider` listener for an element using an event emitting listeners.
-- | Each `slider` listener emitted replaces the previous `slider` listener.
slider
  :: Event (Number -> Effect Unit)
  -> Array (Attribute D.Input_)
slider = slider' unpureAttr map

-- | Sets a `slider` listener for an element using a constant listener.
slider_
  :: (Number -> Effect Unit)
  -> Array (Attribute D.Input_)
slider_ = slider' pureAttr identity

numeric' :: forall t92 e94 a98 b103. Attr e94 D.Xtype String => (D.OnInput -> a98 -> Attribute e94) -> (((Number -> Effect b103) -> Cb) -> t92 -> a98) -> t92 -> Array (Attribute e94)
numeric' f1 f2 i = [ D.Xtype !:= "numeric" ] <>
  [ f1 D.OnInput $ f2
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
  :: Event (Number -> Effect Unit)
  -> Array (Attribute D.Input_)
numeric = numeric' unpureAttr map

-- | Sets a numeric `input` listener for an element using a constant listener.
numeric_
  :: (Number -> Effect Unit)
  -> Array (Attribute D.Input_)
numeric_ = numeric' pureAttr identity

checkbox' :: forall t256 e258 a262 b267. Attr e258 D.Xtype String => (D.OnInput -> a262 -> Attribute e258) -> (((Boolean -> Effect b267) -> Cb) -> t256 -> a262) -> t256 -> Array (Attribute e258)
checkbox' f1 f2 i = [ D.Xtype !:= "checkbox" ] <>
  [ f1 D.OnInput $ f2
      ( \push ->
          cb \e -> for_
            (target e >>= fromEventTarget)
            (checked >=> push)
      )
      i
  ]

-- | Sets a `checkbox` listener for an element using an event emitting listeners.
-- | Each `checkbox` listener emitted replaces the previous `checkbox` listener.
checkbox
  :: Event (Boolean -> Effect Unit)
  -> Array (Attribute D.Input_)
checkbox = checkbox' unpureAttr map

-- | Sets a `checkbox` listener for an element using a constant listener.
checkbox_
  :: (Boolean -> Effect Unit)
  -> Array (Attribute D.Input_)
checkbox_ = checkbox' pureAttr identity

textInput' :: forall t3 a4 b5 b9. (D.OnInput -> a4 -> b5) -> (((String -> Effect b9) -> Cb) -> t3 -> a4) -> t3 -> b5
textInput' f1 f2 ev = f1 D.OnInput $ f2
  ( \push -> cb \e -> for_
      (target e >>= fromEventTarget)
      (value >=> push)
  )
  ev

-- | Sets a text-based `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
textInput
  :: forall e
   . Event (String -> Effect Unit)
  -> Attribute e
textInput = textInput' unpureAttr map

-- | Sets a text-based `input` listener for an element using a constant listener.
textInput_
  :: forall e
   . (String -> Effect Unit)
  -> Attribute e
textInput_ = textInput' pureAttr identity

keyEvent' :: forall t136 t139 a140 b141 b145. t136 -> (t136 -> a140 -> b141) -> (((KeyboardEvent -> Effect b145) -> Cb) -> t139 -> a140) -> t139 -> b141
keyEvent' listener f1 f2 ev = f1 listener $ f2
  (\f -> cb \e -> for_ (fromEvent e) f)
  ev

-- | Sets a `keyup` listener for an element using a constant listener.
keyUp_
  :: forall element
   . (KeyboardEvent -> Effect Unit)
  -> Attribute element
keyUp_ = keyEvent' D.OnKeyup pureAttr identity

-- | Sets a `keyup` listener for an element using an event emitting listeners.
-- | Each `keyup` listener emitted replaces the previous `keyup` listener.
keyUp
  :: forall element
   . Event (KeyboardEvent -> Effect Unit)
  -> Attribute element
keyUp = keyEvent' D.OnKeyup unpureAttr map

-- | Sets a `keydown` listener for an element using a constant listener.
keyDown_
  :: forall element
   . (KeyboardEvent -> Effect Unit)
  -> Attribute element
keyDown_ = keyEvent' D.OnKeydown pureAttr identity

-- | Sets a `keydown` listener for an element using an event emitting listeners.
-- | Each `keydown` listener emitted replaces the previous `keydown` listener.
keyDown
  :: forall element
   . Event (KeyboardEvent -> Effect Unit)
  -> Attribute element
keyDown = keyEvent' D.OnKeydown unpureAttr map

-- | Sets a `keypress` listener for an element using a constant listener.
keyPress_
  :: forall element
   . (KeyboardEvent -> Effect Unit)
  -> Attribute element
keyPress_ = keyEvent' D.OnKeypress pureAttr identity

-- | Sets a `keypress` listener for an element using an event emitting listeners.
-- | Each `keypress` listener emitted replaces the previous `keypress` listener.
keyPress
  :: forall element
   . Event (KeyboardEvent -> Effect Unit)
  -> Attribute element
keyPress = keyEvent' D.OnKeypress unpureAttr map

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
injectElement f = D.Self !:= \s -> launchAff_
  (delay (Milliseconds 0.0) *> liftEffect (f s))

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall e te
   . Attr e D.SelfT (te -> Effect Unit)
  => (te -> Effect Unit)
  -> Attribute e
injectElementT f = D.SelfT !:= \s -> launchAff_
  (delay (Milliseconds 0.0) *> liftEffect (f s))