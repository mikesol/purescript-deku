module Deku.DOM.Attr.D where

import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data D = D

instance Attr Path_ D String where
  attr D value = unsafeAttribute { key: "d", value: prop' value }