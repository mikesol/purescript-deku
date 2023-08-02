module Deku.DOM.Attr.FilterRes where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterRes = FilterRes

instance Attr Filter_ FilterRes (NonEmpty.NonEmpty Event.Event  String ) where
  attr FilterRes bothValues = unsafeAttribute $ Both
    { key: "filterRes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "filterRes", value: prop' value })
instance Attr Filter_ FilterRes  String  where
  attr FilterRes value = unsafeAttribute $ This
    { key: "filterRes", value: prop' value }
instance Attr Filter_ FilterRes (Event.Event  String ) where
  attr FilterRes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filterRes", value: prop' value }

instance Attr everything FilterRes (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FilterRes bothValues = unsafeAttribute $ Both
    { key: "filterRes", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "filterRes", value: unset' })
instance Attr everything FilterRes  Unit  where
  attr FilterRes _ = unsafeAttribute $ This
    { key: "filterRes", value: unset' }
instance Attr everything FilterRes (Event.Event  Unit ) where
  attr FilterRes eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "filterRes", value: unset' }
