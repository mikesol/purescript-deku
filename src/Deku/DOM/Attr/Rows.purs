module Deku.DOM.Attr.Rows where

import Prelude

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rows = Rows

instance Attr Textarea_ Rows String where
  attr Rows value = unsafeAttribute { key: "rows", value: prop' value }

instance Attr everything Rows Unit where
  attr Rows _ = unsafeAttribute
    { key: "rows", value: unset' }
