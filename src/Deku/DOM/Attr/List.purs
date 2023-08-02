module Deku.DOM.Attr.List where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data List = List

instance Attr Input_ List (NonEmpty.NonEmpty Event.Event  String ) where
  attr List bothValues = unsafeAttribute $ Both
    { key: "list", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "list", value: prop' value })
instance Attr Input_ List  String  where
  attr List value = unsafeAttribute $ This
    { key: "list", value: prop' value }
instance Attr Input_ List (Event.Event  String ) where
  attr List eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "list", value: prop' value }

instance Attr everything List (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr List bothValues = unsafeAttribute $ Both { key: "list", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "list", value: unset' })
instance Attr everything List  Unit  where
  attr List _ = unsafeAttribute $ This { key: "list", value: unset' }
instance Attr everything List (Event.Event  Unit ) where
  attr List eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "list", value: unset' }
