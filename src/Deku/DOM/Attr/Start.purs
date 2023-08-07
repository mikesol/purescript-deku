module Deku.DOM.Attr.Start where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Start = Start

instance Attr Ol_ Start  String  where
  attr Start value = unsafeAttribute (  
    { key: "start", value: prop' value  } <$ _)
instance Attr Ol_ Start (Event.Event  String ) where
  attr Start eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "start", value: prop' value }


instance Attr everything Start  Unit  where
  attr Start _ = unsafeAttribute (  { key: "start", value: unset'  } <$ _)
instance Attr everything Start (Event.Event  Unit ) where
  attr Start eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "start", value: unset' }
