module Deku.DOM.Attr.Ping where

import Prelude

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ping = Ping

instance Attr A_ Ping String where
  attr Ping value = unsafeAttribute { key: "ping", value: prop' value }

instance Attr Area_ Ping String where
  attr Ping value = unsafeAttribute { key: "ping", value: prop' value }

instance Attr everything Ping Unit where
  attr Ping _ = unsafeAttribute
    { key: "ping", value: unset' }
