module Deku.DOM.Attr.Data where

import Prelude

import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Data = Data

instance Attr Object_ Data String where
  attr Data value = unsafeAttribute { key: "data", value: prop' value }

instance Attr everything Data Unit where
  attr Data _ = unsafeAttribute
    { key: "data", value: unset' }
