module Deku.DOM.Attr.FilterUnits where

import Prelude

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterUnits = FilterUnits

instance Attr Filter_ FilterUnits String where
  attr FilterUnits value = unsafeAttribute
    { key: "filterUnits", value: prop' value }

instance Attr everything FilterUnits Unit where
  attr FilterUnits _ = unsafeAttribute
    { key: "filterUnits", value: unset' }
