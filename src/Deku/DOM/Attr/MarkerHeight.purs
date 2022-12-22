module Deku.DOM.Attr.MarkerHeight where

import Prelude

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerHeight = MarkerHeight

instance Attr Marker_ MarkerHeight String where
  attr MarkerHeight value = unsafeAttribute
    { key: "markerHeight", value: prop' value }

instance Attr everything MarkerHeight Unit where
  attr MarkerHeight _ = unsafeAttribute
    { key: "markerHeight", value: unset' }
