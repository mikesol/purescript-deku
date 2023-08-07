module Deku.DOM.Attr.Dirname where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dirname = Dirname

instance Attr Input_ Dirname  String  where
  attr Dirname value = unsafeAttribute (  
    { key: "dirname", value: prop' value  } <$ _)
instance Attr Input_ Dirname (Event.Event  String ) where
  attr Dirname eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dirname", value: prop' value }


instance Attr Textarea_ Dirname  String  where
  attr Dirname value = unsafeAttribute (  
    { key: "dirname", value: prop' value  } <$ _)
instance Attr Textarea_ Dirname (Event.Event  String ) where
  attr Dirname eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dirname", value: prop' value }


instance Attr everything Dirname  Unit  where
  attr Dirname _ = unsafeAttribute (  { key: "dirname", value: unset'  } <$ _)
instance Attr everything Dirname (Event.Event  Unit ) where
  attr Dirname eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "dirname", value: unset' }
