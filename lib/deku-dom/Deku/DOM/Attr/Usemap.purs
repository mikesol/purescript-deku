module Deku.DOM.Attr.Usemap where

import Prelude

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Usemap = Usemap

instance Attr Img_ Usemap String where
  attr Usemap value = unsafeAttribute { key: "usemap", value: prop' value }

instance Attr Input_ Usemap String where
  attr Usemap value = unsafeAttribute { key: "usemap", value: prop' value }

instance Attr Object_ Usemap String where
  attr Usemap value = unsafeAttribute { key: "usemap", value: prop' value }

instance Attr everything Usemap Unit where
  attr Usemap _ = unsafeAttribute
    { key: "usemap", value: unset' }
