module Deku.DOM.Attr.KeyPoints where

import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data KeyPoints = KeyPoints

instance Attr AnimateMotion_ KeyPoints String where
  attr KeyPoints value = unsafeAttribute
    { key: "keyPoints", value: prop' value }