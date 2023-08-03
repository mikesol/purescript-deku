module Deku.DOM.Attr.Low where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Low = Low

instance Attr Meter_ Low (NonEmpty.NonEmpty Event.Event  String ) where
  attr Low bothValues = unsafeAttribute $ Both (pure 
    { key: "low", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "low", value: prop' value })
instance Attr Meter_ Low  String  where
  attr Low value = unsafeAttribute $ This $ pure $ { key: "low", value: prop' value }
instance Attr Meter_ Low (Event.Event  String ) where
  attr Low eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "low", value: prop' value }

instance Attr everything Low (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Low bothValues = unsafeAttribute $ Both (pure  { key: "low", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "low", value: unset' })
instance Attr everything Low  Unit  where
  attr Low _ = unsafeAttribute $ This $ pure $ { key: "low", value: unset' }
instance Attr everything Low (Event.Event  Unit ) where
  attr Low eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "low", value: unset' }
