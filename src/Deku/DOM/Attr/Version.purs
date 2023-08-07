module Deku.DOM.Attr.Version where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Version = Version

instance Attr Svg_ Version  String  where
  attr Version value = unsafeAttribute (  
    { key: "version", value: prop' value  } <$ _)
instance Attr Svg_ Version (Event.Event  String ) where
  attr Version eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "version", value: prop' value }


instance Attr everything Version  Unit  where
  attr Version _ = unsafeAttribute (  { key: "version", value: unset'  } <$ _)
instance Attr everything Version (Event.Event  Unit ) where
  attr Version eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "version", value: unset' }
