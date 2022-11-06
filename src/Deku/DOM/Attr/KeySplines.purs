module Deku.DOM.Attr.KeySplines where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data KeySplines = KeySplines

instance Attr Animate_ KeySplines String where
  attr KeySplines value = unsafeAttribute { key: "keySplines", value: prop' value }
instance Attr AnimateMotion_ KeySplines String where
  attr KeySplines value = unsafeAttribute { key: "keySplines", value: prop' value }
instance Attr AnimateTransform_ KeySplines String where
  attr KeySplines value = unsafeAttribute { key: "keySplines", value: prop' value }