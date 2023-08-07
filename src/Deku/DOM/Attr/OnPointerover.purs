module Deku.DOM.Attr.OnPointerover where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerover = OnPointerover

instance Attr anything OnPointerover  Cb  where
  attr OnPointerover value = unsafeAttribute (  
    { key: "pointerover", value: cb' value  } <$ _)
instance Attr anything OnPointerover (Event.Event  Cb ) where
  attr OnPointerover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerover", value: cb' value }


instance Attr anything OnPointerover  (Effect Unit)  where
  attr OnPointerover value = unsafeAttribute (  
    { key: "pointerover", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerover (Event.Event  (Effect Unit) ) where
  attr OnPointerover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerover  (Effect Boolean)  where
  attr OnPointerover value = unsafeAttribute (  
    { key: "pointerover", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerover (Event.Event  (Effect Boolean) ) where
  attr OnPointerover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const value)) } 


instance Attr everything OnPointerover  Unit  where
  attr OnPointerover _ = unsafeAttribute (  
    { key: "pointerover", value: unset'  } <$ _)
instance Attr everything OnPointerover (Event.Event  Unit ) where
  attr OnPointerover eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointerover", value: unset' }
