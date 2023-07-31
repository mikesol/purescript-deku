module Deku.DOM.Attr.Kind where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Track (Track_)

data Kind = Kind

instance Deku.Attribute.Attr everything Kind Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "kind", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Track_ Kind String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "kind", value: _ } <<< Deku.Attribute.prop'
