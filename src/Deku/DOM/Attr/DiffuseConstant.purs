module Deku.DOM.Attr.DiffuseConstant where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data DiffuseConstant = DiffuseConstant
instance Attr FeDiffuseLighting_ DiffuseConstant  String  where
  attr DiffuseConstant value = unsafeAttribute (  
    { key: "diffuseConstant", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ DiffuseConstant (Event.Event Unit -> Event.Event  String ) where
  attr DiffuseConstant eventValue = unsafeAttribute (map (map ( \value -> { key: "diffuseConstant", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ DiffuseConstant (Event.Event  String ) where
  attr DiffuseConstant eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "diffuseConstant", value: prop' value }
instance Attr everything DiffuseConstant  Unit  where
  attr DiffuseConstant _ = unsafeAttribute (  
    { key: "diffuseConstant", value: unset'  } <$ _)
instance Attr everything DiffuseConstant (Event.Event Unit -> Event.Event  Unit ) where
  attr DiffuseConstant eventValue = unsafeAttribute (map (map ( \_ -> { key: "diffuseConstant", value: unset' })) eventValue)
instance Attr everything DiffuseConstant (Event.Event  Unit ) where
  attr DiffuseConstant eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "diffuseConstant", value: unset' }