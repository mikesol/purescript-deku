module Deku.DOM.Attr.Multiple where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Multiple = Multiple

instance Attr Input_ Multiple (NonEmpty.NonEmpty Event.Event  String ) where
  attr Multiple bothValues = unsafeAttribute $ Both
    { key: "multiple", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "multiple", value: prop' value })
instance Attr Input_ Multiple  String  where
  attr Multiple value = unsafeAttribute $ This
    { key: "multiple", value: prop' value }
instance Attr Input_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "multiple", value: prop' value }

instance Attr Select_ Multiple (NonEmpty.NonEmpty Event.Event  String ) where
  attr Multiple bothValues = unsafeAttribute $ Both
    { key: "multiple", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "multiple", value: prop' value })
instance Attr Select_ Multiple  String  where
  attr Multiple value = unsafeAttribute $ This
    { key: "multiple", value: prop' value }
instance Attr Select_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "multiple", value: prop' value }

instance Attr everything Multiple (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Multiple bothValues = unsafeAttribute $ Both
    { key: "multiple", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "multiple", value: unset' })
instance Attr everything Multiple  Unit  where
  attr Multiple _ = unsafeAttribute $ This
    { key: "multiple", value: unset' }
instance Attr everything Multiple (Event.Event  Unit ) where
  attr Multiple eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "multiple", value: unset' }
