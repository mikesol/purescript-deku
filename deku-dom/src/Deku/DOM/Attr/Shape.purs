module Deku.DOM.Attr.Shape where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)

data Shape = Shape

instance Deku.Attribute.Attr everything Shape Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "shape", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Shape String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "shape", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Shape String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "shape", value: _ } <<< Deku.Attribute.prop'
