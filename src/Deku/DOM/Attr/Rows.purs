module Deku.DOM.Attr.Rows where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rows = Rows

instance Attr Textarea_ Rows (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rows bothValues = unsafeAttribute $ Both
    { key: "rows", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rows", value: prop' value })
instance Attr Textarea_ Rows  String  where
  attr Rows value = unsafeAttribute $ This $ pure $
    { key: "rows", value: prop' value }
instance Attr Textarea_ Rows (Event.Event  String ) where
  attr Rows eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rows", value: prop' value }

instance Attr everything Rows (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rows bothValues = unsafeAttribute $ Both { key: "rows", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "rows", value: unset' })
instance Attr everything Rows  Unit  where
  attr Rows _ = unsafeAttribute $ This $ pure $ { key: "rows", value: unset' }
instance Attr everything Rows (Event.Event  Unit ) where
  attr Rows eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rows", value: unset' }
