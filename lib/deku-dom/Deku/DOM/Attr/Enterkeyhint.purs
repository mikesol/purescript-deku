module Deku.DOM.Attr.Enterkeyhint where

import Prelude

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enterkeyhint = Enterkeyhint

instance Attr Textarea_ Enterkeyhint String where
  attr Enterkeyhint value = unsafeAttribute
    { key: "enterkeyhint", value: prop' value }

instance Attr everything Enterkeyhint Unit where
  attr Enterkeyhint _ = unsafeAttribute
    { key: "enterkeyhint", value: unset' }
