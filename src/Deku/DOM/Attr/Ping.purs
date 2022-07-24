module Deku.DOM.Attr.Ping where

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Ping = Ping

instance Attr A_ Ping String where
  attr Ping value = unsafeAttribute { key: "ping", value: prop' value }

instance Attr Area_ Ping String where
  attr Ping value = unsafeAttribute { key: "ping", value: prop' value }
