module Deku.DOM.Attr.Optimum where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Optimum = Optimum

instance Attr Meter_ Optimum (NonEmpty.NonEmpty Event.Event  String ) where
  attr Optimum bothValues = unsafeAttribute $ Both
    { key: "optimum", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "optimum", value: prop' value })
instance Attr Meter_ Optimum  String  where
  attr Optimum value = unsafeAttribute $ This
    { key: "optimum", value: prop' value }
instance Attr Meter_ Optimum (Event.Event  String ) where
  attr Optimum eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "optimum", value: prop' value }

instance Attr everything Optimum (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Optimum bothValues = unsafeAttribute $ Both
    { key: "optimum", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "optimum", value: unset' })
instance Attr everything Optimum  Unit  where
  attr Optimum _ = unsafeAttribute $ This { key: "optimum", value: unset' }
instance Attr everything Optimum (Event.Event  Unit ) where
  attr Optimum eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "optimum", value: unset' }
