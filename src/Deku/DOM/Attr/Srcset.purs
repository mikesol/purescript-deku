module Deku.DOM.Attr.Srcset where

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Srcset = Srcset

instance Attr Img_ Srcset String where
  attr Srcset value = unsafeAttribute { key: "srcset", value: prop' value }

instance Attr Source_ Srcset String where
  attr Srcset value = unsafeAttribute { key: "srcset", value: prop' value }
