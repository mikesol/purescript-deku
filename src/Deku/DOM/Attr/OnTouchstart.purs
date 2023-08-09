module Deku.DOM.Attr.OnTouchstart where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnTouchstart = OnTouchstart
instance Attr anything OnTouchstart  Cb  where
  attr OnTouchstart value = unsafeAttribute (  
    { key: "touchstart", value: cb' value  } <$ _)
instance Attr anything OnTouchstart (Event.Event Unit -> Event.Event  Cb ) where
  attr OnTouchstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "touchstart", value: cb' value })) eventValue)
instance Attr anything OnTouchstart (Event.Event  Cb ) where
  attr OnTouchstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchstart", value: cb' value }
instance Attr anything OnTouchstart  (Effect Unit)  where
  attr OnTouchstart value = unsafeAttribute (  
    { key: "touchstart", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTouchstart (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnTouchstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnTouchstart (Event.Event  (Effect Unit) ) where
  attr OnTouchstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchstart  (Effect Boolean)  where
  attr OnTouchstart value = unsafeAttribute (  
    { key: "touchstart", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTouchstart (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnTouchstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "touchstart", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnTouchstart (Event.Event  (Effect Boolean) ) where
  attr OnTouchstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const value)) } 
instance Attr everything OnTouchstart  Unit  where
  attr OnTouchstart _ = unsafeAttribute (  
    { key: "touchstart", value: unset'  } <$ _)
instance Attr everything OnTouchstart (Event.Event Unit -> Event.Event  Unit ) where
  attr OnTouchstart eventValue = unsafeAttribute (map (map (
    \_ -> { key: "touchstart", value: unset' })) eventValue)
instance Attr everything OnTouchstart (Event.Event  Unit ) where
  attr OnTouchstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "touchstart", value: unset' }