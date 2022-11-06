module Deku.DOM.Attr.Radius where

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Radius = Radius

instance Attr FeMorphology_ Radius String where
  attr Radius value = unsafeAttribute { key: "radius", value: prop' value }