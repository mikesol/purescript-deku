module Deku.DOM.Attr.Capture where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Capture = Capture

instance Attr Input_ Capture String where
  attr Capture value = unsafeAttribute { key: "capture", value: prop' value }

instance Attr everything Capture Unit where
  attr Capture _ = unsafeAttribute
    { key: "capture", value: unset' }
