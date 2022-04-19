module Deku.DOM.Attr.OnTransitioncancel where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTransitioncancel = OnTransitioncancel
instance Attr anything OnTransitioncancel Cb where
  attr OnTransitioncancel value = unsafeAttribute { key: "transitioncancel", value: cb' value }