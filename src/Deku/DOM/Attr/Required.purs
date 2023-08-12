module Deku.DOM.Attr.Required where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Required = Required

instance Attr Input_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Select_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Textarea_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr everything Required Unit where
  attr Required _ = unsafeAttribute
    { key: "required", value: unset' }
