module Deku.DOM.Attr.OnPlay where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPlay = OnPlay
instance Attr anything OnPlay Cb where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' value }