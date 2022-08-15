module Deku.DOM.Attr.Defer where

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Defer = Defer

instance Attr Script_ Defer String where
  attr Defer value = unsafeAttribute { key: "defer", value: prop' value }
