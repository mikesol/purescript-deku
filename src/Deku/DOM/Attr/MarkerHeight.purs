module Deku.DOM.Attr.MarkerHeight where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerHeight = MarkerHeight

instance Attr Marker_ MarkerHeight  String  where
  attr MarkerHeight value = unsafeAttribute $ Left $  
    { key: "markerHeight", value: prop' value }
instance Attr Marker_ MarkerHeight (Event.Event  String ) where
  attr MarkerHeight eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "markerHeight", value: prop' value }


instance Attr everything MarkerHeight  Unit  where
  attr MarkerHeight _ = unsafeAttribute $ Left $  
    { key: "markerHeight", value: unset' }
instance Attr everything MarkerHeight (Event.Event  Unit ) where
  attr MarkerHeight eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "markerHeight", value: unset' }
