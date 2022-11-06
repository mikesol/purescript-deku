module Deku.DOM.Attr.Begin where

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Begin = Begin

instance Attr Animate_ Begin String where
  attr Begin value = unsafeAttribute { key: "begin", value: prop' value }
instance Attr AnimateMotion_ Begin String where
  attr Begin value = unsafeAttribute { key: "begin", value: prop' value }
instance Attr AnimateTransform_ Begin String where
  attr Begin value = unsafeAttribute { key: "begin", value: prop' value }
instance Attr Set_ Begin String where
  attr Begin value = unsafeAttribute { key: "begin", value: prop' value }