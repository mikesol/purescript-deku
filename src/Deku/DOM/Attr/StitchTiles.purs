module Deku.DOM.Attr.StitchTiles where

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data StitchTiles = StitchTiles

instance Attr FeTurbulence_ StitchTiles String where
  attr StitchTiles value = unsafeAttribute { key: "stitchTiles", value: prop' value }