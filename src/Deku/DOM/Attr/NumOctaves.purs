module Deku.DOM.Attr.NumOctaves where

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves String where
  attr NumOctaves value = unsafeAttribute { key: "numOctaves", value: prop' value }