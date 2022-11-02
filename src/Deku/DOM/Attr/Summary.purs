module Deku.DOM.Attr.Summary where

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Summary = Summary

instance Attr Table_ Summary String where
  attr Summary value = unsafeAttribute { key: "summary", value: prop' value }
