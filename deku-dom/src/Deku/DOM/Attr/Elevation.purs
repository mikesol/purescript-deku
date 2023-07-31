module Deku.DOM.Attr.Elevation where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)

data Elevation = Elevation

instance Deku.Attribute.Attr everything Elevation Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "elevation", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDistantLight_ Elevation String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "elevation", value: _ } <<<
    Deku.Attribute.prop'
