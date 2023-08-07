module Deku.DOM.Attr.ClipPathUnits where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ClipPathUnits = ClipPathUnits

instance Attr ClipPath_ ClipPathUnits  String  where
  attr ClipPathUnits value = unsafeAttribute (  
    { key: "clipPathUnits", value: prop' value  } <$ _)
instance Attr ClipPath_ ClipPathUnits (Event.Event  String ) where
  attr ClipPathUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "clipPathUnits", value: prop' value }


instance Attr everything ClipPathUnits  Unit  where
  attr ClipPathUnits _ = unsafeAttribute (  
    { key: "clipPathUnits", value: unset'  } <$ _)
instance Attr everything ClipPathUnits (Event.Event  Unit ) where
  attr ClipPathUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "clipPathUnits", value: unset' }
