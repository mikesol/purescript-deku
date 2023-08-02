module Deku.DOM.Attr.Pattern where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Pattern = Pattern

instance Attr Input_ Pattern (NonEmpty.NonEmpty Event.Event  String ) where
  attr Pattern bothValues = unsafeAttribute $ Both
    { key: "pattern", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pattern", value: prop' value })
instance Attr Input_ Pattern  String  where
  attr Pattern value = unsafeAttribute $ This
    { key: "pattern", value: prop' value }
instance Attr Input_ Pattern (Event.Event  String ) where
  attr Pattern eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pattern", value: prop' value }

instance Attr everything Pattern (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Pattern bothValues = unsafeAttribute $ Both
    { key: "pattern", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pattern", value: unset' })
instance Attr everything Pattern  Unit  where
  attr Pattern _ = unsafeAttribute $ This { key: "pattern", value: unset' }
instance Attr everything Pattern (Event.Event  Unit ) where
  attr Pattern eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "pattern", value: unset' }
