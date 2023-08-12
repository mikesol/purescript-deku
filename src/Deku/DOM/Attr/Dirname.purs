module Deku.DOM.Attr.Dirname where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dirname = Dirname

instance Attr Input_ Dirname String where
  attr Dirname value = unsafeAttribute { key: "dirname", value: prop' value }

instance Attr Textarea_ Dirname String where
  attr Dirname value = unsafeAttribute { key: "dirname", value: prop' value }

instance Attr everything Dirname Unit where
  attr Dirname _ = unsafeAttribute
    { key: "dirname", value: unset' }
