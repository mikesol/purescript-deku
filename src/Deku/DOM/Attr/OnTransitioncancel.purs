module Deku.DOM.Attr.OnTransitioncancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnTransitioncancel = OnTransitioncancel
instance Attr anything OnTransitioncancel Cb where
  attr OnTransitioncancel value = unsafeAttribute { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitioncancel (Effect Unit) where
  attr OnTransitioncancel value = unsafeAttribute { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitioncancel (Effect Boolean) where
  attr OnTransitioncancel value = unsafeAttribute { key: "transitioncancel", value: cb' (Cb (const value)) }