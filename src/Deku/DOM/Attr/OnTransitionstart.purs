module Deku.DOM.Attr.OnTransitionstart where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTransitionstart = OnTransitionstart
instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' value }