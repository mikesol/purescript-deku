module Deku.DOM.Attr.OnTransitionend where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTransitionend = OnTransitionend
instance Attr anything OnTransitionend Cb where
  attr OnTransitionend value = unsafeAttribute { key: "transitionend", value: cb' value }