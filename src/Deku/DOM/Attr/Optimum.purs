module Deku.DOM.Attr.Optimum where

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Optimum = Optimum

instance Attr Meter_ Optimum String where
  attr Optimum value = unsafeAttribute { key: "optimum", value: prop' value }
