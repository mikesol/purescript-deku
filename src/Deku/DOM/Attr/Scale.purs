module Deku.DOM.Attr.Scale where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scale = Scale

instance Attr FeDisplacementMap_ Scale  String  where
  attr Scale value = unsafeAttribute (  
    { key: "scale", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ Scale (Event.Event  String ) where
  attr Scale eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "scale", value: prop' value }


instance Attr everything Scale  Unit  where
  attr Scale _ = unsafeAttribute (  { key: "scale", value: unset'  } <$ _)
instance Attr everything Scale (Event.Event  Unit ) where
  attr Scale eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "scale", value: unset' }
