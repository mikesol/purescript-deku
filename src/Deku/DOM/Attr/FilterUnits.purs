module Deku.DOM.Attr.FilterUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterUnits = FilterUnits

instance Attr Filter_ FilterUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr FilterUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "filterUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filterUnits", value: prop' value })
instance Attr Filter_ FilterUnits  String  where
  attr FilterUnits value = unsafeAttribute $ This $ pure $
    { key: "filterUnits", value: prop' value }
instance Attr Filter_ FilterUnits (Event.Event  String ) where
  attr FilterUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filterUnits", value: prop' value }

instance Attr everything FilterUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FilterUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "filterUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "filterUnits", value: unset' })
instance Attr everything FilterUnits  Unit  where
  attr FilterUnits _ = unsafeAttribute $ This $ pure $
    { key: "filterUnits", value: unset' }
instance Attr everything FilterUnits (Event.Event  Unit ) where
  attr FilterUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "filterUnits", value: unset' }
