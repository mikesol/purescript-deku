module Deku.DOM.Attr.LimitingConeAngle where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data LimitingConeAngle = LimitingConeAngle
instance Attr FeSpotLight_ LimitingConeAngle  String  where
  attr LimitingConeAngle value = unsafeAttribute (  
    { key: "limitingConeAngle", value: prop' value  } <$ _)
instance Attr FeSpotLight_ LimitingConeAngle (Event.Event Unit -> Event.Event  String ) where
  attr LimitingConeAngle eventValue = unsafeAttribute (map (map ( \value -> { key: "limitingConeAngle", value: prop' value })) eventValue)
instance Attr FeSpotLight_ LimitingConeAngle (Event.Event  String ) where
  attr LimitingConeAngle eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "limitingConeAngle", value: prop' value }
instance Attr everything LimitingConeAngle  Unit  where
  attr LimitingConeAngle _ = unsafeAttribute (  
    { key: "limitingConeAngle", value: unset'  } <$ _)
instance Attr everything LimitingConeAngle (Event.Event Unit -> Event.Event  Unit ) where
  attr LimitingConeAngle eventValue = unsafeAttribute (map (map ( \_ -> { key: "limitingConeAngle", value: unset' })) eventValue)
instance Attr everything LimitingConeAngle (Event.Event  Unit ) where
  attr LimitingConeAngle eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "limitingConeAngle", value: unset' }