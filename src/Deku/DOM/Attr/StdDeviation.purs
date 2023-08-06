module Deku.DOM.Attr.StdDeviation where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StdDeviation = StdDeviation

instance Attr FeDropShadow_ StdDeviation  String  where
  attr StdDeviation value = unsafeAttribute $ Left $  
    { key: "stdDeviation", value: prop' value }
instance Attr FeDropShadow_ StdDeviation (Event.Event  String ) where
  attr StdDeviation eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "stdDeviation", value: prop' value }


instance Attr FeGaussianBlur_ StdDeviation  String  where
  attr StdDeviation value = unsafeAttribute $ Left $  
    { key: "stdDeviation", value: prop' value }
instance Attr FeGaussianBlur_ StdDeviation (Event.Event  String ) where
  attr StdDeviation eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "stdDeviation", value: prop' value }


instance Attr everything StdDeviation  Unit  where
  attr StdDeviation _ = unsafeAttribute $ Left $  
    { key: "stdDeviation", value: unset' }
instance Attr everything StdDeviation (Event.Event  Unit ) where
  attr StdDeviation eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "stdDeviation", value: unset' }
