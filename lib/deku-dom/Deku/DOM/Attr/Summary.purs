module Deku.DOM.Attr.Summary where

import Prelude

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary String where
  attr Summary value = unsafeAttribute { key: "summary", value: prop' value }

instance Attr everything Summary Unit where
  attr Summary _ = unsafeAttribute
    { key: "summary", value: unset' }
