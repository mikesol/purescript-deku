module Deku.Listeners
  ( slider
  , click
  , click_
  , keyUp
  , keyDown
  , keyPress
  , textInput
  ) where

import Prelude

import Control.Alt (alt)
import Control.Monad.ST.Class (class MonadST)
import Data.Foldable (for_)
import Deku.Attribute (class Attr, Attribute, Cb, attr, cb, (:=))
import Deku.DOM as D
import Effect (Effect)
import FRP.Event (AnEvent)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value, valueAsNumber)
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
  :: forall s m
   . MonadST s m
  => AnEvent m (Number -> Effect Unit)
  -> AnEvent m (Attribute D.Input_)
slider = alt (pure $ D.Xtype := "range") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

textInput
  :: forall s m e
   . MonadST s m
  => AnEvent m (String -> Effect Unit)
  -> AnEvent m (Attribute e)
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
  :: forall s m eleemnt
   . MonadST s m
  => AnEvent m (KeyboardEvent -> Effect Unit)
  -> AnEvent m (Attribute eleemnt)
keyUp = keyEvent' D.OnKeyup

keyDown
  :: forall s m eleemnt
   . MonadST s m
  => AnEvent m (KeyboardEvent -> Effect Unit)
  -> AnEvent m (Attribute eleemnt)
keyDown = keyEvent' D.OnKeydown

keyPress
  :: forall s m eleemnt
   . MonadST s m
  => AnEvent m (KeyboardEvent -> Effect Unit)
  -> AnEvent m (Attribute eleemnt)
keyPress = keyEvent' D.OnKeypress