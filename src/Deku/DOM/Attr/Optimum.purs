module Deku.DOM.Attr.Optimum where

import Prelude

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Optimum = Optimum

instance Attr Meter_ Optimum String where
  attr Optimum value = unsafeAttribute { key: "optimum", value: prop' value }

instance Attr everything Optimum Unit where
  attr Optimum _ = unsafeAttribute
    { key: "optimum", value: unset' }
