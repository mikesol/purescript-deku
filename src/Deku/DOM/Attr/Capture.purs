module Deku.DOM.Attr.Capture where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Capture = Capture

instance Attr Input_ Capture  String  where
  attr Capture value = unsafeAttribute (  
    { key: "capture", value: prop' value  } <$ _)
instance Attr Input_ Capture (Event.Event  String ) where
  attr Capture eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "capture", value: prop' value }


instance Attr everything Capture  Unit  where
  attr Capture _ = unsafeAttribute (  { key: "capture", value: unset'  } <$ _)
instance Attr everything Capture (Event.Event  Unit ) where
  attr Capture eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "capture", value: unset' }
