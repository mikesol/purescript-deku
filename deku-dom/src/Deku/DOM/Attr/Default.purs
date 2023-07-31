module Deku.DOM.Attr.Default where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Track (Track_)

data Default = Default

instance Deku.Attribute.Attr everything Default Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "default", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Track_ Default String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "default", value: _ } <<< Deku.Attribute.prop'
