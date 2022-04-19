module Deku.DOM.Attr.OnLoad where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnLoad = OnLoad
instance Attr anything OnLoad Cb where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' value }