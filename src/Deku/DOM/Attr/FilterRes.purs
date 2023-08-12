module Deku.DOM.Attr.FilterRes where

import Prelude

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterRes = FilterRes

instance Attr Filter_ FilterRes String where
  attr FilterRes value = unsafeAttribute
    { key: "filterRes", value: prop' value }

instance Attr everything FilterRes Unit where
  attr FilterRes _ = unsafeAttribute
    { key: "filterRes", value: unset' }
