module Deku.DOM.Attr.Step where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Step = Step

instance Attr Input_ Step  String  where
  attr Step value = unsafeAttribute (  
    { key: "step", value: prop' value  } <$ _)
instance Attr Input_ Step (Event.Event  String ) where
  attr Step eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "step", value: prop' value }


instance Attr everything Step  Unit  where
  attr Step _ = unsafeAttribute (  { key: "step", value: unset'  } <$ _)
instance Attr everything Step (Event.Event  Unit ) where
  attr Step eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "step", value: unset' }
