module Deku.DOM.Attr.StitchTiles where

import Prelude

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StitchTiles = StitchTiles

instance Attr FeTurbulence_ StitchTiles String where
  attr StitchTiles value = unsafeAttribute
    { key: "stitchTiles", value: prop' value }

instance Attr everything StitchTiles Unit where
  attr StitchTiles _ = unsafeAttribute
    { key: "stitchTiles", value: unset' }
