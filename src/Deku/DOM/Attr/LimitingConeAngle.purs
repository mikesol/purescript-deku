module Deku.DOM.Attr.LimitingConeAngle where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LimitingConeAngle = LimitingConeAngle

instance Attr FeSpotLight_ LimitingConeAngle (NonEmpty.NonEmpty Event.Event  String ) where
  attr LimitingConeAngle bothValues = unsafeAttribute $ Both
    { key: "limitingConeAngle", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "limitingConeAngle", value: prop' value }
    )
instance Attr FeSpotLight_ LimitingConeAngle  String  where
  attr LimitingConeAngle value = unsafeAttribute $ This
    { key: "limitingConeAngle", value: prop' value }
instance Attr FeSpotLight_ LimitingConeAngle (Event.Event  String ) where
  attr LimitingConeAngle eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "limitingConeAngle", value: prop' value }

instance Attr everything LimitingConeAngle (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr LimitingConeAngle bothValues = unsafeAttribute $ Both
    { key: "limitingConeAngle", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "limitingConeAngle", value: unset' })
instance Attr everything LimitingConeAngle  Unit  where
  attr LimitingConeAngle _ = unsafeAttribute $ This
    { key: "limitingConeAngle", value: unset' }
instance Attr everything LimitingConeAngle (Event.Event  Unit ) where
  attr LimitingConeAngle eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "limitingConeAngle", value: unset' }
