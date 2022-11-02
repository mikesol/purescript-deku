module Deku.DOM.Attr.Cols where

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Cols = Cols

instance Attr Textarea_ Cols String where
  attr Cols value = unsafeAttribute { key: "cols", value: prop' value }
