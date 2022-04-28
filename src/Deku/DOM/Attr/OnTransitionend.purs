module Deku.DOM.Attr.OnTransitionend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnTransitionend = OnTransitionend
instance Attr anything OnTransitionend Cb where
  attr OnTransitionend value = unsafeAttribute { key: "transitionend", value: cb' value }
instance Attr anything OnTransitionend (Effect Unit) where
  attr OnTransitionend value = unsafeAttribute { key: "transitionend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionend (Effect Boolean) where
  attr OnTransitionend value = unsafeAttribute { key: "transitionend", value: cb' (Cb (const value)) }