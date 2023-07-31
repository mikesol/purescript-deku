module Deku.DOM.Attr.StitchTiles where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)

data StitchTiles = StitchTiles

instance Deku.Attribute.Attr everything StitchTiles Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stitchTiles", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeTurbulence_ StitchTiles String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stitchTiles", value: _ } <<<
    Deku.Attribute.prop'
