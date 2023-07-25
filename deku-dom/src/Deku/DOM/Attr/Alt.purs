module Deku.DOM.Attr.Alt where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)

data Alt = Alt

instance Deku.Attribute.Attr everything Alt Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "alt", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Area_ Alt String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alt", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Alt String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alt", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Alt String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alt", value: _ } <<< Deku.Attribute.prop'
