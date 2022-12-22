module Deku.DOM.Attr.Low where

import Prelude

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Low = Low

instance Attr Meter_ Low String where
  attr Low value = unsafeAttribute { key: "low", value: prop' value }

instance Attr everything Low Unit where
  attr Low _ = unsafeAttribute
    { key: "low", value: unset' }
