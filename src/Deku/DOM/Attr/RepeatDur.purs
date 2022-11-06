module Deku.DOM.Attr.RepeatDur where

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data RepeatDur = RepeatDur

instance Attr Animate_ RepeatDur String where
  attr RepeatDur value = unsafeAttribute
    { key: "repeatDur", value: prop' value }

instance Attr AnimateMotion_ RepeatDur String where
  attr RepeatDur value = unsafeAttribute
    { key: "repeatDur", value: prop' value }

instance Attr AnimateTransform_ RepeatDur String where
  attr RepeatDur value = unsafeAttribute
    { key: "repeatDur", value: prop' value }

instance Attr Set_ RepeatDur String where
  attr RepeatDur value = unsafeAttribute
    { key: "repeatDur", value: prop' value }