module Deku.DOM.Attr.LimitingConeAngle where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LimitingConeAngle = LimitingConeAngle

instance Attr FeSpotLight_ LimitingConeAngle  String  where
  attr LimitingConeAngle value = unsafeAttribute $ Left $  
    { key: "limitingConeAngle", value: prop' value }
instance Attr FeSpotLight_ LimitingConeAngle (Event.Event  String ) where
  attr LimitingConeAngle eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "limitingConeAngle", value: prop' value }


instance Attr everything LimitingConeAngle  Unit  where
  attr LimitingConeAngle _ = unsafeAttribute $ Left $  
    { key: "limitingConeAngle", value: unset' }
instance Attr everything LimitingConeAngle (Event.Event  Unit ) where
  attr LimitingConeAngle eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "limitingConeAngle", value: unset' }
