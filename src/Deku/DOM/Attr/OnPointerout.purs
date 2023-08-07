module Deku.DOM.Attr.OnPointerout where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerout = OnPointerout

instance Attr anything OnPointerout  Cb  where
  attr OnPointerout value = unsafeAttribute (  
    { key: "pointerout", value: cb' value  } <$ _)
instance Attr anything OnPointerout (Event.Event  Cb ) where
  attr OnPointerout eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerout", value: cb' value }


instance Attr anything OnPointerout  (Effect Unit)  where
  attr OnPointerout value = unsafeAttribute (  
    { key: "pointerout", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerout (Event.Event  (Effect Unit) ) where
  attr OnPointerout eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerout  (Effect Boolean)  where
  attr OnPointerout value = unsafeAttribute (  
    { key: "pointerout", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerout (Event.Event  (Effect Boolean) ) where
  attr OnPointerout eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const value)) } 


instance Attr everything OnPointerout  Unit  where
  attr OnPointerout _ = unsafeAttribute (  
    { key: "pointerout", value: unset'  } <$ _)
instance Attr everything OnPointerout (Event.Event  Unit ) where
  attr OnPointerout eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointerout", value: unset' }
