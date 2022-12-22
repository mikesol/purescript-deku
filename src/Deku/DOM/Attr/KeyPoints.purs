module Deku.DOM.Attr.KeyPoints where

import Prelude

import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyPoints = KeyPoints

instance Attr AnimateMotion_ KeyPoints String where
  attr KeyPoints value = unsafeAttribute
    { key: "keyPoints", value: prop' value }

instance Attr everything KeyPoints Unit where
  attr KeyPoints _ = unsafeAttribute
    { key: "keyPoints", value: unset' }
