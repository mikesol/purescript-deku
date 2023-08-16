-- | This module contains various helper functions for setting listeners on elements.
-- |
-- | Listeners are usually of type `Effect Unit` but can also be of type `Effect Boolean`
-- | and `DOM.Event -> Effect Boolean`. This comes from the constraint
-- | `Attr element D.MyListener cb`, where `cb` will be whatever listener is permissable.
module Deku.Listeners
  ( click
  , click_
  , slider
  , slider_
  , numeric
  , numeric_
  , checkbox
  , checkbox_
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
import Deku.Attribute (Attribute)
import Deku.DOM as D
import Deku.DOM.Self as Self
import Effect (Effect)
import Effect.Aff (launchAff_, delay, Milliseconds(..))
import Effect.Class (liftEffect)
import FRP.Event (Event)
import Type.Proxy (Proxy)
import Web.DOM (Element)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (checked, fromEventTarget, value, valueAsNumber)
import Web.UIEvent.KeyboardEvent (KeyboardEvent, fromEvent)

-- | Set a `click` listener for an element using an event emitting listeners.
-- | Each `click` listener emitted replaces the previous `click` listener.
click
  :: forall r
   . Event (Effect Unit)
  -> Event (Attribute (onClick :: D.EventEffect | r))
click = D._onClick <<< map const

-- | Set a `click` listener for an element using a constant listener.
click_
  :: forall r 
   . Effect Unit
  -> Event (Attribute (onClick :: D.EventEffect | r))
click_ = click <<< pure

type InputAttribute r = (type :: String, onInput :: D.EventEffect | r)

-- | Sets a `slider` listener for an element using a constant listener.
slider_
  :: forall r
   . (Number -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
slider_ = slider <<< pure

-- | Sets a `slider` listener for an element using an event emitting listeners.
-- | Each `slider` listener emitted replaces the previous `slider` listener.
slider
  :: forall r
   . Event (Number -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
slider ps =
  alt
    (D._type_ D.__range)
    ( D._onInput $ flip map ps \push e ->
        for_
          (target e >>= fromEventTarget)
          (valueAsNumber >=> push)
    )

-- | Sets a numeric `input` listener for an element using a constant listener.
numeric_
  :: forall r
   . (Number -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
numeric_ = numeric <<< pure

-- | Sets a numeric `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
numeric
  :: forall r
   . Event (Number -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
numeric ps =
  alt
    (D._type_ D.__number)
    ( D._onInput $ flip map ps \push e ->
        for_
          (target e >>= fromEventTarget)
          (valueAsNumber >=> push)
    )

-- | Sets a `checkbox` listener for an element using a constant listener.
checkbox_
  :: forall r
   . (Boolean -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
checkbox_ = checkbox <<< pure

-- | Sets a `checkbox` listener for an element using an event emitting listeners.
-- | Each `checkbox` listener emitted replaces the previous `checkbox` listener.
checkbox
  :: forall r
   . Event (Boolean -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
checkbox ps =
  alt
    (D._type_ D.__checkbox)
    ( D._onInput $ flip map ps \push e ->
        for_
          (target e >>= fromEventTarget)
          (checked >=> push)
    )

-- | Sets a text-based `input` listener for an element using a constant listener.
textInput_
  :: forall r
   . (String -> Effect Unit)
  -> Event (Attribute (InputAttribute r))
textInput_ = textInput <<< pure

-- | Sets a text-based `input` listener for an element using an event emitting listeners.
-- | Each `input` listener emitted replaces the previous `input` listener.
textInput
  :: forall r
   . Event (String -> Effect Unit)
  -> Event (Attribute (onInput :: D.EventEffect | r))
textInput =
  D._onInput <<< map \push e ->
    for_
      (target e >>= fromEventTarget)
      (value >=> push)

keyEvent'
  :: forall r
   . (Event D.EventEffect -> Event (Attribute r))
  -> Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute r)
keyEvent' listener = listener <<< map \push e -> for_ (fromEvent e) push

-- | Sets a `keyup` listener for an element using a constant listener.
keyUp_
  :: forall r
   . (KeyboardEvent -> Effect Unit)
  -> Event (Attribute (onKeyup :: D.EventEffect | r))
keyUp_ = keyUp <<< pure

-- | Sets a `keyup` listener for an element using an event emitting listeners.
-- | Each `keyup` listener emitted replaces the previous `keyup` listener.
keyUp
  :: forall r
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute (onKeyup :: D.EventEffect | r))
keyUp = keyEvent' D._onKeyup

-- | Sets a `keydown` listener for an element using a constant listener.
keyDown_
  :: forall r
   . (KeyboardEvent -> Effect Unit)
  -> Event (Attribute (onKeydown :: D.EventEffect | r))
keyDown_ = keyDown <<< pure

-- | Sets a `keydown` listener for an element using an event emitting listeners.
-- | Each `keydown` listener emitted replaces the previous `keydown` listener.
keyDown
  :: forall r
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute (onKeydown :: D.EventEffect | r))
keyDown = keyEvent' D._onKeydown

-- | Sets a `keypress` listener for an element using a constant listener.
keyPress_
  :: forall r
   . (KeyboardEvent -> Effect Unit)
  -> Event (Attribute (onKeypress :: D.EventEffect | r))
keyPress_ = keyPress <<< pure

-- | Sets a `keypress` listener for an element using an event emitting listeners.
-- | Each `keypress` listener emitted replaces the previous `keypress` listener.
keyPress
  :: forall r
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute (onKeypress :: D.EventEffect | r))
keyPress = keyEvent' D._onKeypress

-- | Sets a listener that injects a primitive DOM element into a closed scope immediately after element creation.
-- | Importantly, this does _not happen_ on the same tick as the element creation but rather during the next DOM tick.
-- | This is to guarantee that element creation happens before trying to use the element.
-- | In practice this delay will be on the order of microseconds but it can veer into milliseconds if
-- | the UI thread is particularly busy.
injectElement
  :: forall e
   . (Element -> Effect Unit)
  -> Event (Attribute e)
injectElement f =
  Self._self_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s

-- | A typesafe version of `injectElement` that uses `SelfT` instead of `Self`.
injectElementT
  :: forall r typedElement tag
   . Self.IsSelf typedElement tag
  => (typedElement -> Effect Unit)
  -> Event (Attribute (__nominal :: Proxy tag | r))
injectElementT f =
  Self._selfT_ \s -> launchAff_ do
    delay $ Milliseconds 0.0
    liftEffect $ f s
