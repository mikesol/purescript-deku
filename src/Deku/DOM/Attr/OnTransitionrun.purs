module Deku.DOM.Attr.OnTransitionrun where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)


data OnTransitionrun = OnTransitionrun
instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun value = unsafeAttribute { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionrun (Effect Unit) where
  attr OnTransitionrun value = unsafeAttribute { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionrun (Effect Boolean) where
  attr OnTransitionrun value = unsafeAttribute { key: "transitionrun", value: cb' (Cb (const value)) }