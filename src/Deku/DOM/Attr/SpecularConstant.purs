module Deku.DOM.Attr.SpecularConstant where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularConstant = SpecularConstant

instance Attr FeSpecularLighting_ SpecularConstant  String  where
  attr SpecularConstant value = unsafeAttribute $ Left $  
    { key: "specularConstant", value: prop' value }
instance Attr FeSpecularLighting_ SpecularConstant (Event.Event  String ) where
  attr SpecularConstant eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "specularConstant", value: prop' value }


instance Attr everything SpecularConstant  Unit  where
  attr SpecularConstant _ = unsafeAttribute $ Left $  
    { key: "specularConstant", value: unset' }
instance Attr everything SpecularConstant (Event.Event  Unit ) where
  attr SpecularConstant eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "specularConstant", value: unset' }
