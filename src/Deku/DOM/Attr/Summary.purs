module Deku.DOM.Attr.Summary where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary (NonEmpty.NonEmpty Event.Event  String ) where
  attr Summary bothValues = unsafeAttribute $ Both
    { key: "summary", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "summary", value: prop' value })
instance Attr Table_ Summary  String  where
  attr Summary value = unsafeAttribute $ This $ pure $
    { key: "summary", value: prop' value }
instance Attr Table_ Summary (Event.Event  String ) where
  attr Summary eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "summary", value: prop' value }

instance Attr everything Summary (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Summary bothValues = unsafeAttribute $ Both
    { key: "summary", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "summary", value: unset' })
instance Attr everything Summary  Unit  where
  attr Summary _ = unsafeAttribute $ This $ pure $ { key: "summary", value: unset' }
instance Attr everything Summary (Event.Event  Unit ) where
  attr Summary eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "summary", value: unset' }
