module Deku.DOM.Attr.FilterUnits where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterUnits = FilterUnits

instance Attr Filter_ FilterUnits  String  where
  attr FilterUnits value = unsafeAttribute (  
    { key: "filterUnits", value: prop' value  } <$ _)
instance Attr Filter_ FilterUnits (Event.Event  String ) where
  attr FilterUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "filterUnits", value: prop' value }


instance Attr everything FilterUnits  Unit  where
  attr FilterUnits _ = unsafeAttribute (  
    { key: "filterUnits", value: unset'  } <$ _)
instance Attr everything FilterUnits (Event.Event  Unit ) where
  attr FilterUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "filterUnits", value: unset' }
