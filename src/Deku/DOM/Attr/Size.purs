module Deku.DOM.Attr.Size where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Size = Size

instance Attr Input_ Size (NonEmpty.NonEmpty Event.Event  String ) where
  attr Size bothValues = unsafeAttribute $ Both
    { key: "size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "size", value: prop' value })
instance Attr Input_ Size  String  where
  attr Size value = unsafeAttribute $ This
    { key: "size", value: prop' value }
instance Attr Input_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "size", value: prop' value }

instance Attr Select_ Size (NonEmpty.NonEmpty Event.Event  String ) where
  attr Size bothValues = unsafeAttribute $ Both
    { key: "size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "size", value: prop' value })
instance Attr Select_ Size  String  where
  attr Size value = unsafeAttribute $ This
    { key: "size", value: prop' value }
instance Attr Select_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "size", value: prop' value }

instance Attr everything Size (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Size bothValues = unsafeAttribute $ Both { key: "size", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "size", value: unset' })
instance Attr everything Size  Unit  where
  attr Size _ = unsafeAttribute $ This { key: "size", value: unset' }
instance Attr everything Size (Event.Event  Unit ) where
  attr Size eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "size", value: unset' }
