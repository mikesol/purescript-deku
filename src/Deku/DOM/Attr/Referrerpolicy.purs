module Deku.DOM.Attr.Referrerpolicy where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Referrerpolicy = Referrerpolicy

instance Attr A_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute (  
    { key: "referrerpolicy", value: prop' value  } <$ _)
instance Attr A_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }


instance Attr Area_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute (  
    { key: "referrerpolicy", value: prop' value  } <$ _)
instance Attr Area_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }


instance Attr Iframe_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute (  
    { key: "referrerpolicy", value: prop' value  } <$ _)
instance Attr Iframe_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }


instance Attr Img_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute (  
    { key: "referrerpolicy", value: prop' value  } <$ _)
instance Attr Img_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }


instance Attr Link_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute (  
    { key: "referrerpolicy", value: prop' value  } <$ _)
instance Attr Link_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }


instance Attr Script_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute (  
    { key: "referrerpolicy", value: prop' value  } <$ _)
instance Attr Script_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }


instance Attr everything Referrerpolicy  Unit  where
  attr Referrerpolicy _ = unsafeAttribute (  
    { key: "referrerpolicy", value: unset'  } <$ _)
instance Attr everything Referrerpolicy (Event.Event  Unit ) where
  attr Referrerpolicy eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "referrerpolicy", value: unset' }
