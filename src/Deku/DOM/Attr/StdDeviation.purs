module Deku.DOM.Attr.StdDeviation where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StdDeviation = StdDeviation

instance Attr FeDropShadow_ StdDeviation (NonEmpty.NonEmpty Event.Event  String ) where
  attr StdDeviation bothValues = unsafeAttribute $ Both (pure 
    { key: "stdDeviation", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stdDeviation", value: prop' value })
instance Attr FeDropShadow_ StdDeviation  String  where
  attr StdDeviation value = unsafeAttribute $ This $ pure $
    { key: "stdDeviation", value: prop' value }
instance Attr FeDropShadow_ StdDeviation (Event.Event  String ) where
  attr StdDeviation eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stdDeviation", value: prop' value }

instance Attr FeGaussianBlur_ StdDeviation (NonEmpty.NonEmpty Event.Event  String ) where
  attr StdDeviation bothValues = unsafeAttribute $ Both (pure 
    { key: "stdDeviation", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stdDeviation", value: prop' value })
instance Attr FeGaussianBlur_ StdDeviation  String  where
  attr StdDeviation value = unsafeAttribute $ This $ pure $
    { key: "stdDeviation", value: prop' value }
instance Attr FeGaussianBlur_ StdDeviation (Event.Event  String ) where
  attr StdDeviation eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stdDeviation", value: prop' value }

instance Attr everything StdDeviation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StdDeviation bothValues = unsafeAttribute $ Both (pure 
    { key: "stdDeviation", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stdDeviation", value: unset' })
instance Attr everything StdDeviation  Unit  where
  attr StdDeviation _ = unsafeAttribute $ This $ pure $
    { key: "stdDeviation", value: unset' }
instance Attr everything StdDeviation (Event.Event  Unit ) where
  attr StdDeviation eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stdDeviation", value: unset' }
