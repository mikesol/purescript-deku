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

import Control.Alt (alt)
import Data.Foldable (for_)
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
  => Event cb
  -> Event (Attribute element)
click = map (attr D.OnClick)

-- | Set a `click` listener for an element using a constant listener.
click_
  :: forall cb element
   . Attr element D.OnClick cb
  => cb
  -> Event (Attribute element)
click_ = click <<< pure

-- | Sets a `slider` listener for an element using a constant listener.
slider_
  :: (Number -> Effect Unit)
  -> Event (Attribute D.Input_)
slider_ = slider <<< pure

-- | Sets a `slider` listener for an element using an event emitting listeners.
-- | Each `slider` listener emitted replaces the previous `slider` listener.
slider
  :: Event (Number -> Effect Unit)
  -> Event (Attribute D.Input_)
slider = alt (pure $ D.Xtype := "range") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

-- | Sets a numeric `input` listener for an element using a constant listener.
numeric_
  :: (Number -> Effect Unit)
  -> Event (Attribute D.Input_)
numeric_ = numeric <<< pure

-- | Sets a numeric `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
numeric
  :: Event (Number -> Effect Unit)
  -> Event (Attribute D.Input_)
numeric = alt (pure $ D.Xtype := "number") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

-- | Sets a `checkbox` listener for an element using a constant listener.
checkbox_
  :: (Boolean -> Effect Unit)
  -> Event (Attribute D.Input_)
checkbox_ = checkbox <<< pure

-- | Sets a `checkbox` listener for an element using an event emitting listeners.
-- | Each `checkbox` listener emitted replaces the previous `checkbox` listener.
checkbox
  :: Event (Boolean -> Effect Unit)
  -> Event (Attribute D.Input_)
checkbox = alt (pure $ D.Xtype := "checkbox") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (checked >=> push)
  )

-- | Sets a text-based `input` listener for an element using a constant listener.
textInput_
  :: forall e
   . (String -> Effect Unit)
  -> Event (Attribute e)
textInput_ = textInput <<< pure

-- | Sets a text-based `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
textInput
  :: forall e
   . Event (String -> Effect Unit)
  -> Event (Attribute e)
textInput = map \push -> D.OnInput := cb \e -> for_
  (target e >>= fromEventTarget)
  (value >=> push)

keyEvent'
  :: forall f59 a62 e64 b66
   . Functor f59
  => Attr e64 a62 Cb
  => a62
  -> f59 (KeyboardEvent -> Effect b66)
  -> f59 (Attribute e64)
keyEvent' listener = map \f -> listener := cb \e -> for_ (fromEvent e) f

-- | Sets a `keyup` listener for an element using a constant listener.
keyUp_
  :: forall element
   . (KeyboardEvent -> Effect Unit)
  -> Event (Attribute element)
keyUp_ = keyUp <<< pure

-- | Sets a `keyup` listener for an element using an event emitting listeners.
-- | Each `keyup` listener emitted replaces the previous `keyup` listener.
keyUp
  :: forall element
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute element)
keyUp = keyEvent' D.OnKeyup

-- | Sets a `keydown` listener for an element using a constant listener.
keyDown_
  :: forall element
   . (KeyboardEvent -> Effect Unit)
  -> Event (Attribute element)
keyDown_ = keyDown <<< pure

-- | Sets a `keydown` listener for an element using an event emitting listeners.
-- | Each `keydown` listener emitted replaces the previous `keydown` listener.
keyDown
  :: forall element
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute element)
keyDown = keyEvent' D.OnKeydown

-- | Sets a `keypress` listener for an element using a constant listener.
keyPress_
  :: forall element
   . (KeyboardEvent -> Effect Unit)
  -> Event (Attribute element)
keyPress_ = keyPress <<< pure

-- | Sets a `keypress` listener for an element using an event emitting listeners.
-- | Each `keypress` listener emitted replaces the previous `keypress` listener.
keyPress
  :: forall element
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute element)
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
  -> Event (Attribute e)
injectElement f = pure
  (D.Self := \s -> launchAff_ (delay (Milliseconds 0.0) *> liftEffect (f s)))

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall e te
   . Attr e D.SelfT (te -> Effect Unit)
  => (te -> Effect Unit)
  -> Event (Attribute e)
injectElementT f = pure
  (D.SelfT := \s -> launchAff_ (delay (Milliseconds 0.0) *> liftEffect (f s)))