module Deku.DOM.Attr.SpecularConstant where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data SpecularConstant = SpecularConstant
instance Attr FeSpecularLighting_ SpecularConstant  String  where
  attr SpecularConstant value = unsafeAttribute (  
    { key: "specularConstant", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ SpecularConstant (Event.Event Unit -> Event.Event  String ) where
  attr SpecularConstant eventValue = unsafeAttribute (map (map ( \value -> { key: "specularConstant", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ SpecularConstant (Event.Event  String ) where
  attr SpecularConstant eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "specularConstant", value: prop' value }
instance Attr everything SpecularConstant  Unit  where
  attr SpecularConstant _ = unsafeAttribute (  
    { key: "specularConstant", value: unset'  } <$ _)
instance Attr everything SpecularConstant (Event.Event Unit -> Event.Event  Unit ) where
  attr SpecularConstant eventValue = unsafeAttribute (map (map ( \_ -> { key: "specularConstant", value: unset' })) eventValue)
instance Attr everything SpecularConstant (Event.Event  Unit ) where
  attr SpecularConstant eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "specularConstant", value: unset' }