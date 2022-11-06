module Deku.DOM.Attr.FilterRes where

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data FilterRes = FilterRes

instance Attr Filter_ FilterRes String where
  attr FilterRes value = unsafeAttribute
    { key: "filterRes", value: prop' value }