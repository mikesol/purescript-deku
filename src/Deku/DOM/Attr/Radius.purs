module Deku.DOM.Attr.Radius where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Radius = Radius

instance Attr FeMorphology_ Radius  String  where
  attr Radius value = unsafeAttribute (  
    { key: "radius", value: prop' value  } <$ _)
instance Attr FeMorphology_ Radius (Event.Event  String ) where
  attr Radius eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "radius", value: prop' value }


instance Attr everything Radius  Unit  where
  attr Radius _ = unsafeAttribute (  { key: "radius", value: unset'  } <$ _)
instance Attr everything Radius (Event.Event  Unit ) where
  attr Radius eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "radius", value: unset' }
