module Deku.DOM.Attr.Integrity where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Integrity = Integrity

instance Attr Link_ Integrity  String  where
  attr Integrity value = unsafeAttribute (  
    { key: "integrity", value: prop' value  } <$ _)
instance Attr Link_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "integrity", value: prop' value }


instance Attr Script_ Integrity  String  where
  attr Integrity value = unsafeAttribute (  
    { key: "integrity", value: prop' value  } <$ _)
instance Attr Script_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "integrity", value: prop' value }


instance Attr everything Integrity  Unit  where
  attr Integrity _ = unsafeAttribute (  
    { key: "integrity", value: unset'  } <$ _)
instance Attr everything Integrity (Event.Event  Unit ) where
  attr Integrity eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "integrity", value: unset' }
