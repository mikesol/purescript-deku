module Deku.DOM.Attr.Border where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Table (Table_)

data Border = Border

instance Deku.Attribute.Attr everything Border Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "border", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Border String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "border", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Border String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "border", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Border String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "border", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Table_ Border String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "border", value: _ } <<< Deku.Attribute.prop'
