module Deku.DOM.Attr.Cols where

import Prelude

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cols = Cols

instance Attr Textarea_ Cols String where
  attr Cols value = unsafeAttribute { key: "cols", value: prop' value }

instance Attr everything Cols Unit where
  attr Cols _ = unsafeAttribute
    { key: "cols", value: unset' }
