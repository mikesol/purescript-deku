module Deku.DOM.Attr.Enterkeyhint where

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Enterkeyhint = Enterkeyhint

instance Attr Textarea_ Enterkeyhint String where
  attr Enterkeyhint value = unsafeAttribute
    { key: "enterkeyhint", value: prop' value }
