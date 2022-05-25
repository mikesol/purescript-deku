module Deku.DOM.Attr.Start where

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Start = Start

instance Attr Ol_ Start String where
  attr Start value = unsafeAttribute { key: "start", value: prop' value }
