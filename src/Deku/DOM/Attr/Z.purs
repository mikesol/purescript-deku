module Deku.DOM.Attr.Z where

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Z = Z

instance Attr FePointLight_ Z String where
  attr Z value = unsafeAttribute { key: "z", value: prop' value }
instance Attr FeSpotLight_ Z String where
  attr Z value = unsafeAttribute { key: "z", value: prop' value }