module Deku.DOM.Attr.Usemap where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)

data Usemap = Usemap

instance Deku.Attribute.Attr everything Usemap Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "usemap", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Usemap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "usemap", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Usemap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "usemap", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Usemap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "usemap", value: _ } <<< Deku.Attribute.prop'
