module Deku.DOM.Attr.OnTouchcancel where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel  Cb  where
  attr OnTouchcancel value = unsafeAttribute (  
    { key: "touchcancel", value: cb' value  } <$ _)
instance Attr anything OnTouchcancel (Event.Event  Cb ) where
  attr OnTouchcancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchcancel", value: cb' value }


instance Attr anything OnTouchcancel  (Effect Unit)  where
  attr OnTouchcancel value = unsafeAttribute (  
    { key: "touchcancel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTouchcancel (Event.Event  (Effect Unit) ) where
  attr OnTouchcancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTouchcancel  (Effect Boolean)  where
  attr OnTouchcancel value = unsafeAttribute (  
    { key: "touchcancel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTouchcancel (Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const value)) } 


instance Attr everything OnTouchcancel  Unit  where
  attr OnTouchcancel _ = unsafeAttribute (  
    { key: "touchcancel", value: unset'  } <$ _)
instance Attr everything OnTouchcancel (Event.Event  Unit ) where
  attr OnTouchcancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "touchcancel", value: unset' }
