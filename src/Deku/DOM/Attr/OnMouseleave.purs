module Deku.DOM.Attr.OnMouseleave where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseleave = OnMouseleave

instance Attr anything OnMouseleave  Cb  where
  attr OnMouseleave value = unsafeAttribute (  
    { key: "mouseleave", value: cb' value  } <$ _)
instance Attr anything OnMouseleave (Event.Event  Cb ) where
  attr OnMouseleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseleave", value: cb' value }


instance Attr anything OnMouseleave  (Effect Unit)  where
  attr OnMouseleave value = unsafeAttribute (  
    { key: "mouseleave", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMouseleave (Event.Event  (Effect Unit) ) where
  attr OnMouseleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseleave  (Effect Boolean)  where
  attr OnMouseleave value = unsafeAttribute (  
    { key: "mouseleave", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMouseleave (Event.Event  (Effect Boolean) ) where
  attr OnMouseleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const value)) } 


instance Attr everything OnMouseleave  Unit  where
  attr OnMouseleave _ = unsafeAttribute (  
    { key: "mouseleave", value: unset'  } <$ _)
instance Attr everything OnMouseleave (Event.Event  Unit ) where
  attr OnMouseleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mouseleave", value: unset' }
