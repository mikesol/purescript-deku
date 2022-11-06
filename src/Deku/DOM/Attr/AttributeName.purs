module Deku.DOM.Attr.AttributeName where

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data AttributeName = AttributeName

instance Attr Animate_ AttributeName String where
  attr AttributeName value = unsafeAttribute { key: "attributeName", value: prop' value }
instance Attr AnimateMotion_ AttributeName String where
  attr AttributeName value = unsafeAttribute { key: "attributeName", value: prop' value }
instance Attr AnimateTransform_ AttributeName String where
  attr AttributeName value = unsafeAttribute { key: "attributeName", value: prop' value }
instance Attr Set_ AttributeName String where
  attr AttributeName value = unsafeAttribute { key: "attributeName", value: prop' value }