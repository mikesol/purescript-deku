module Deku.DOM.Attr.Seed where

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Seed = Seed

instance Attr FeTurbulence_ Seed String where
  attr Seed value = unsafeAttribute { key: "seed", value: prop' value }