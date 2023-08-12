module Deku.DOM.Attr.Radius where

import Prelude

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Radius = Radius

instance Attr FeMorphology_ Radius String where
  attr Radius value = unsafeAttribute { key: "radius", value: prop' value }

instance Attr everything Radius Unit where
  attr Radius _ = unsafeAttribute
    { key: "radius", value: unset' }
