module Deku.DOM.Attr.Step where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Step = Step

instance Attr Input_ Step String where
  attr Step value = unsafeAttribute { key: "step", value: prop' value }

instance Attr everything Step Unit where
  attr Step _ = unsafeAttribute
    { key: "step", value: unset' }
