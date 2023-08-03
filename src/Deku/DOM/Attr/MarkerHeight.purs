module Deku.DOM.Attr.MarkerHeight where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerHeight = MarkerHeight

instance Attr Marker_ MarkerHeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerHeight bothValues = unsafeAttribute $ Both (pure 
    { key: "markerHeight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "markerHeight", value: prop' value })
instance Attr Marker_ MarkerHeight  String  where
  attr MarkerHeight value = unsafeAttribute $ This $ pure $
    { key: "markerHeight", value: prop' value }
instance Attr Marker_ MarkerHeight (Event.Event  String ) where
  attr MarkerHeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerHeight", value: prop' value }

instance Attr everything MarkerHeight (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MarkerHeight bothValues = unsafeAttribute $ Both (pure 
    { key: "markerHeight", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerHeight", value: unset' })
instance Attr everything MarkerHeight  Unit  where
  attr MarkerHeight _ = unsafeAttribute $ This $ pure $
    { key: "markerHeight", value: unset' }
instance Attr everything MarkerHeight (Event.Event  Unit ) where
  attr MarkerHeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerHeight", value: unset' }
