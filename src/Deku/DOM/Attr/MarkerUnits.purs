module Deku.DOM.Attr.MarkerUnits where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerUnits = MarkerUnits

instance Attr Marker_ MarkerUnits  String  where
  attr MarkerUnits value = unsafeAttribute (  
    { key: "markerUnits", value: prop' value  } <$ _)
instance Attr Marker_ MarkerUnits (Event.Event  String ) where
  attr MarkerUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "markerUnits", value: prop' value }


instance Attr everything MarkerUnits  Unit  where
  attr MarkerUnits _ = unsafeAttribute (  
    { key: "markerUnits", value: unset'  } <$ _)
instance Attr everything MarkerUnits (Event.Event  Unit ) where
  attr MarkerUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "markerUnits", value: unset' }
