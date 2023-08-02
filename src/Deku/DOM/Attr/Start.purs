module Deku.DOM.Attr.Start where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Start = Start

instance Attr Ol_ Start (NonEmpty.NonEmpty Event.Event  String ) where
  attr Start bothValues = unsafeAttribute $ Both
    { key: "start", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "start", value: prop' value })
instance Attr Ol_ Start  String  where
  attr Start value = unsafeAttribute $ This
    { key: "start", value: prop' value }
instance Attr Ol_ Start (Event.Event  String ) where
  attr Start eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "start", value: prop' value }

instance Attr everything Start (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Start bothValues = unsafeAttribute $ Both { key: "start", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "start", value: unset' })
instance Attr everything Start  Unit  where
  attr Start _ = unsafeAttribute $ This { key: "start", value: unset' }
instance Attr everything Start (Event.Event  Unit ) where
  attr Start eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "start", value: unset' }
