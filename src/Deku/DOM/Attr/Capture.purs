module Deku.DOM.Attr.Capture where

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Capture = Capture

instance Attr Input_ Capture String where
  attr Capture value = unsafeAttribute { key: "capture", value: prop' value }
