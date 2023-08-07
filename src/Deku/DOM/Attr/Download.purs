module Deku.DOM.Attr.Download where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Download = Download

instance Attr A_ Download  String  where
  attr Download value = unsafeAttribute (  
    { key: "download", value: prop' value  } <$ _)
instance Attr A_ Download (Event.Event  String ) where
  attr Download eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "download", value: prop' value }


instance Attr Area_ Download  String  where
  attr Download value = unsafeAttribute (  
    { key: "download", value: prop' value  } <$ _)
instance Attr Area_ Download (Event.Event  String ) where
  attr Download eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "download", value: prop' value }


instance Attr everything Download  Unit  where
  attr Download _ = unsafeAttribute (  
    { key: "download", value: unset'  } <$ _)
instance Attr everything Download (Event.Event  Unit ) where
  attr Download eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "download", value: unset' }
