module Deku.DOM.Attr.Maxlength where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Maxlength = Maxlength

instance Attr Input_ Maxlength String where
  attr Maxlength value = unsafeAttribute
    { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength String where
  attr Maxlength value = unsafeAttribute
    { key: "maxlength", value: prop' value }

instance Attr everything Maxlength Unit where
  attr Maxlength _ = unsafeAttribute
    { key: "maxlength", value: unset' }
