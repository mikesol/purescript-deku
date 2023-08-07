module Deku.DOM.Attr.ViewTarget where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewTarget = ViewTarget

instance Attr View_ ViewTarget  String  where
  attr ViewTarget value = unsafeAttribute (  
    { key: "viewTarget", value: prop' value  } <$ _)
instance Attr View_ ViewTarget (Event.Event  String ) where
  attr ViewTarget eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "viewTarget", value: prop' value }


instance Attr everything ViewTarget  Unit  where
  attr ViewTarget _ = unsafeAttribute (  
    { key: "viewTarget", value: unset'  } <$ _)
instance Attr everything ViewTarget (Event.Event  Unit ) where
  attr ViewTarget eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "viewTarget", value: unset' }
