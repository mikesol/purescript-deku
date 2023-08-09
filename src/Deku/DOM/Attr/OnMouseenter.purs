module Deku.DOM.Attr.OnMouseenter where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnMouseenter = OnMouseenter
instance Attr anything OnMouseenter  Cb  where
  attr OnMouseenter value = unsafeAttribute (  
    { key: "mouseenter", value: cb' value  } <$ _)
instance Attr anything OnMouseenter (Event.Event Unit -> Event.Event  Cb ) where
  attr OnMouseenter eventValue = unsafeAttribute (map (map (
    \value -> { key: "mouseenter", value: cb' value })) eventValue)
instance Attr anything OnMouseenter (Event.Event  Cb ) where
  attr OnMouseenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseenter  (Effect Unit)  where
  attr OnMouseenter value = unsafeAttribute (  
    { key: "mouseenter", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMouseenter (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnMouseenter eventValue = unsafeAttribute (map (map (
    \value -> { key: "mouseenter", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnMouseenter (Event.Event  (Effect Unit) ) where
  attr OnMouseenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseenter  (Effect Boolean)  where
  attr OnMouseenter value = unsafeAttribute (  
    { key: "mouseenter", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMouseenter (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnMouseenter eventValue = unsafeAttribute (map (map (
    \value -> { key: "mouseenter", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnMouseenter (Event.Event  (Effect Boolean) ) where
  attr OnMouseenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const value)) } 
instance Attr everything OnMouseenter  Unit  where
  attr OnMouseenter _ = unsafeAttribute (  
    { key: "mouseenter", value: unset'  } <$ _)
instance Attr everything OnMouseenter (Event.Event Unit -> Event.Event  Unit ) where
  attr OnMouseenter eventValue = unsafeAttribute (map (map (
    \_ -> { key: "mouseenter", value: unset' })) eventValue)
instance Attr everything OnMouseenter (Event.Event  Unit ) where
  attr OnMouseenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mouseenter", value: unset' }