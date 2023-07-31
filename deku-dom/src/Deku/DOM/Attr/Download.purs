module Deku.DOM.Attr.Download where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)

data Download = Download

instance Deku.Attribute.Attr everything Download Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "download", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Download String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "download", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Download String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "download", value: _ } <<< Deku.Attribute.prop'
