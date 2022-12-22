module Deku.DOM.Attr.Start where

import Prelude

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Start = Start

instance Attr Ol_ Start String where
  attr Start value = unsafeAttribute { key: "start", value: prop' value }

instance Attr everything Start Unit where
  attr Start _ = unsafeAttribute
    { key: "start", value: unset' }
