module Deku.DOM.Attr.Accumulate where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Accumulate = Accumulate

instance Attr Animate_ Accumulate String where
  attr Accumulate value = unsafeAttribute
    { key: "accumulate", value: prop' value }

instance Attr AnimateMotion_ Accumulate String where
  attr Accumulate value = unsafeAttribute
    { key: "accumulate", value: prop' value }

instance Attr AnimateTransform_ Accumulate String where
  attr Accumulate value = unsafeAttribute
    { key: "accumulate", value: prop' value }