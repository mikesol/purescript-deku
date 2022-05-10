module Deku.Listeners where

import Prelude

import Control.Alt (alt)
import Data.Foldable (for_)
import Deku.Attribute (class Attr, Attribute, attr, cb, (:=))
import Deku.DOM as D
import Effect (Effect)
import FRP.Event (AnEvent, bang)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, valueAsNumber)

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
  :: forall m
   . Applicative m
  => AnEvent m (Number -> Effect Unit)
  -> AnEvent m (Attribute D.Input_)
slider = alt (bang $ D.Xtype := "range") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        ( target e
            >>= fromEventTarget
        )
        ( valueAsNumber
            >=> push
        )
  )
