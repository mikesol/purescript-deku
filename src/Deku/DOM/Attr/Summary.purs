module Deku.DOM.Attr.Summary where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary  String  where
  attr Summary value = unsafeAttribute (  
    { key: "summary", value: prop' value  } <$ _)
instance Attr Table_ Summary (Event.Event  String ) where
  attr Summary eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "summary", value: prop' value }


instance Attr everything Summary  Unit  where
  attr Summary _ = unsafeAttribute (  { key: "summary", value: unset'  } <$ _)
instance Attr everything Summary (Event.Event  Unit ) where
  attr Summary eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "summary", value: unset' }
