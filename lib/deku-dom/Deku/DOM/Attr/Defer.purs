module Deku.DOM.Attr.Defer where

import Prelude

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Defer = Defer

instance Attr Script_ Defer String where
  attr Defer value = unsafeAttribute { key: "defer", value: prop' value }

instance Attr everything Defer Unit where
  attr Defer _ = unsafeAttribute
    { key: "defer", value: unset' }
