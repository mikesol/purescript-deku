module Deku.DOM.Attr.PrimitiveUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PrimitiveUnits = PrimitiveUnits

instance Attr Filter_ PrimitiveUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr PrimitiveUnits bothValues = unsafeAttribute $ Both
    { key: "primitiveUnits", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "primitiveUnits", value: prop' value })
instance Attr Filter_ PrimitiveUnits  String  where
  attr PrimitiveUnits value = unsafeAttribute $ This
    { key: "primitiveUnits", value: prop' value }
instance Attr Filter_ PrimitiveUnits (Event.Event  String ) where
  attr PrimitiveUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "primitiveUnits", value: prop' value }

instance Attr everything PrimitiveUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PrimitiveUnits bothValues = unsafeAttribute $ Both
    { key: "primitiveUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "primitiveUnits", value: unset' })
instance Attr everything PrimitiveUnits  Unit  where
  attr PrimitiveUnits _ = unsafeAttribute $ This
    { key: "primitiveUnits", value: unset' }
instance Attr everything PrimitiveUnits (Event.Event  Unit ) where
  attr PrimitiveUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "primitiveUnits", value: unset' }
