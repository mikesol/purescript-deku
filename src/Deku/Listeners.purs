module Deku.Listeners
  ( slider
  , numeric
  , checkbox
  , click
  , click_
  , keyUp
  , keyDown
  , keyPress
  , textInput
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

click
  :: forall event cb element
   . Functor event
  => Attr element D.OnClick cb
  => event cb
  -> event (Attribute element)
click = map (attr D.OnClick)

click_
  :: forall m event cb element
   . Functor event
  => Monoid m
  => Attr element D.OnClick cb
  => event (m -> cb)
  -> event (Attribute element)
click_ = map (attr D.OnClick <<< (_ $ mempty))

slider
  :: Event (Number -> Effect Unit)
  -> Event (Attribute D.Input_)
slider = alt (pure $ D.Xtype := "range") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

numeric
  :: Event (Number -> Effect Unit)
  -> Event (Attribute D.Input_)
numeric = alt (pure $ D.Xtype := "number") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

checkbox
  :: Event (Boolean -> Effect Unit)
  -> Event (Attribute D.Input_)
checkbox = alt (pure $ D.Xtype := "checkbox") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (checked >=> push)
  )

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

keyUp
  :: forall eleemnt
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute eleemnt)
keyUp = keyEvent' D.OnKeyup

keyDown
  :: forall eleemnt
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute eleemnt)
keyDown = keyEvent' D.OnKeydown

keyPress
  :: forall eleemnt
   . Event (KeyboardEvent -> Effect Unit)
  -> Event (Attribute eleemnt)
keyPress = keyEvent' D.OnKeypress

injectElement
  :: forall e
   . Attr e D.Self (Element -> Effect Unit)
  => (Element -> Effect Unit)
  -> Event (Attribute e)
injectElement f = pure
  (D.Self := \s -> launchAff_ (delay (Milliseconds 0.0) *> liftEffect (f s)))

injectElementT
  :: forall e te
   . Attr e D.SelfT (te -> Effect Unit)
  => (te -> Effect Unit)
  -> Event (Attribute e)
injectElementT f = pure
  (D.SelfT := \s -> launchAff_ (delay (Milliseconds 0.0) *> liftEffect (f s)))