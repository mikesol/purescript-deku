module Deku.DOM.Attr.Async where

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Async = Async

instance Attr Script_ Async String where
  attr Async value = unsafeAttribute { key: "async", value: prop' value }
