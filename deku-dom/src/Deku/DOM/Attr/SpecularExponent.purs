module Deku.DOM.Attr.SpecularExponent where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)

data SpecularExponent = SpecularExponent

instance Deku.Attribute.Attr everything SpecularExponent Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "specularExponent", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeSpecularLighting_ SpecularExponent String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "specularExponent", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ SpecularExponent String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "specularExponent", value: _ } <<<
    Deku.Attribute.prop'
