module Deku.DOM.Attr.SpecularExponent where

import Prelude

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularExponent = SpecularExponent

instance Attr FeSpecularLighting_ SpecularExponent String where
  attr SpecularExponent value = unsafeAttribute
    { key: "specularExponent", value: prop' value }

instance Attr FeSpotLight_ SpecularExponent String where
  attr SpecularExponent value = unsafeAttribute
    { key: "specularExponent", value: prop' value }

instance Attr everything SpecularExponent Unit where
  attr SpecularExponent _ = unsafeAttribute
    { key: "specularExponent", value: unset' }
