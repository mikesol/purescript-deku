module Deku.DOM.Attr.SpecularExponent where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularExponent = SpecularExponent

instance Attr FeSpecularLighting_ SpecularExponent  String  where
  attr SpecularExponent value = unsafeAttribute $ Left $  
    { key: "specularExponent", value: prop' value }
instance Attr FeSpecularLighting_ SpecularExponent (Event.Event  String ) where
  attr SpecularExponent eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "specularExponent", value: prop' value }


instance Attr FeSpotLight_ SpecularExponent  String  where
  attr SpecularExponent value = unsafeAttribute $ Left $  
    { key: "specularExponent", value: prop' value }
instance Attr FeSpotLight_ SpecularExponent (Event.Event  String ) where
  attr SpecularExponent eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "specularExponent", value: prop' value }


instance Attr everything SpecularExponent  Unit  where
  attr SpecularExponent _ = unsafeAttribute $ Left $  
    { key: "specularExponent", value: unset' }
instance Attr everything SpecularExponent (Event.Event  Unit ) where
  attr SpecularExponent eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "specularExponent", value: unset' }
