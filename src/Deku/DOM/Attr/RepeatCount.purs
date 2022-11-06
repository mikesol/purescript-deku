module Deku.DOM.Attr.RepeatCount where

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data RepeatCount = RepeatCount

instance Attr Animate_ RepeatCount String where
  attr RepeatCount value = unsafeAttribute
    { key: "repeatCount", value: prop' value }

instance Attr AnimateMotion_ RepeatCount String where
  attr RepeatCount value = unsafeAttribute
    { key: "repeatCount", value: prop' value }

instance Attr AnimateTransform_ RepeatCount String where
  attr RepeatCount value = unsafeAttribute
    { key: "repeatCount", value: prop' value }

instance Attr Set_ RepeatCount String where
  attr RepeatCount value = unsafeAttribute
    { key: "repeatCount", value: prop' value }