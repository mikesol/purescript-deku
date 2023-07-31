module Deku.DOM.Attr.Coords where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Area (Area_)

data Coords = Coords

instance Deku.Attribute.Attr everything Coords Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "coords", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Area_ Coords String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "coords", value: _ } <<< Deku.Attribute.prop'
