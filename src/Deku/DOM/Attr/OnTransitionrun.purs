module Deku.DOM.Attr.OnTransitionrun where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTransitionrun = OnTransitionrun
instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun value = unsafeAttribute { key: "transitionrun", value: cb' value }