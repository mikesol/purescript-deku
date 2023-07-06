module Deku.DOM.Attr.KeyTimes where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyTimes = KeyTimes

instance Attr Animate_ KeyTimes String where
  attr KeyTimes value = unsafeAttribute { key: "keyTimes", value: prop' value }

instance Attr AnimateMotion_ KeyTimes String where
  attr KeyTimes value = unsafeAttribute { key: "keyTimes", value: prop' value }

instance Attr AnimateTransform_ KeyTimes String where
  attr KeyTimes value = unsafeAttribute { key: "keyTimes", value: prop' value }

instance Attr everything KeyTimes Unit where
  attr KeyTimes _ = unsafeAttribute
    { key: "keyTimes", value: unset' }
