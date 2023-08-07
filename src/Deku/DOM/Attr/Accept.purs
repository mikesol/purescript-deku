module Deku.DOM.Attr.Accept where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accept = Accept

instance Attr Form_ Accept  String  where
  attr Accept value = unsafeAttribute (  
    { key: "accept", value: prop' value  } <$ _)
instance Attr Form_ Accept (Event.Event  String ) where
  attr Accept eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "accept", value: prop' value }


instance Attr Input_ Accept  String  where
  attr Accept value = unsafeAttribute (  
    { key: "accept", value: prop' value  } <$ _)
instance Attr Input_ Accept (Event.Event  String ) where
  attr Accept eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "accept", value: prop' value }


instance Attr everything Accept  Unit  where
  attr Accept _ = unsafeAttribute (  { key: "accept", value: unset'  } <$ _)
instance Attr everything Accept (Event.Event  Unit ) where
  attr Accept eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "accept", value: unset' }
