module Deku.DOM.Attr.MarkerWidth where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerWidth = MarkerWidth

instance Attr Marker_ MarkerWidth  String  where
  attr MarkerWidth value = unsafeAttribute $ Left $  
    { key: "markerWidth", value: prop' value }
instance Attr Marker_ MarkerWidth (Event.Event  String ) where
  attr MarkerWidth eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "markerWidth", value: prop' value }


instance Attr everything MarkerWidth  Unit  where
  attr MarkerWidth _ = unsafeAttribute $ Left $  
    { key: "markerWidth", value: unset' }
instance Attr everything MarkerWidth (Event.Event  Unit ) where
  attr MarkerWidth eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "markerWidth", value: unset' }
