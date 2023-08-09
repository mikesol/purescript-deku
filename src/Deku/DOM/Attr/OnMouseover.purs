module Deku.DOM.Attr.OnMouseover where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnMouseover = OnMouseover
instance Attr anything OnMouseover  Cb  where
  attr OnMouseover value = unsafeAttribute (  
    { key: "mouseover", value: cb' value  } <$ _)
instance Attr anything OnMouseover (Event.Event Unit -> Event.Event  Cb ) where
  attr OnMouseover eventValue = unsafeAttribute (map (map (
    \value -> { key: "mouseover", value: cb' value })) eventValue)
instance Attr anything OnMouseover (Event.Event  Cb ) where
  attr OnMouseover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseover", value: cb' value }
instance Attr anything OnMouseover  (Effect Unit)  where
  attr OnMouseover value = unsafeAttribute (  
    { key: "mouseover", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMouseover (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnMouseover eventValue = unsafeAttribute (map (map (
    \value -> { key: "mouseover", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnMouseover (Event.Event  (Effect Unit) ) where
  attr OnMouseover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseover  (Effect Boolean)  where
  attr OnMouseover value = unsafeAttribute (  
    { key: "mouseover", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMouseover (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnMouseover eventValue = unsafeAttribute (map (map (
    \value -> { key: "mouseover", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnMouseover (Event.Event  (Effect Boolean) ) where
  attr OnMouseover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseover", value: cb' (Cb (const value)) } 
instance Attr everything OnMouseover  Unit  where
  attr OnMouseover _ = unsafeAttribute (  
    { key: "mouseover", value: unset'  } <$ _)
instance Attr everything OnMouseover (Event.Event Unit -> Event.Event  Unit ) where
  attr OnMouseover eventValue = unsafeAttribute (map (map (
    \_ -> { key: "mouseover", value: unset' })) eventValue)
instance Attr everything OnMouseover (Event.Event  Unit ) where
  attr OnMouseover eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mouseover", value: unset' }