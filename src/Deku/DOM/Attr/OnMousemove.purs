module Deku.DOM.Attr.OnMousemove where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnMousemove = OnMousemove
instance Attr anything OnMousemove  Cb  where
  attr OnMousemove value = unsafeAttribute (  
    { key: "mousemove", value: cb' value  } <$ _)
instance Attr anything OnMousemove (Event.Event Unit -> Event.Event  Cb ) where
  attr OnMousemove eventValue = unsafeAttribute (map (map (
    \value -> { key: "mousemove", value: cb' value })) eventValue)
instance Attr anything OnMousemove (Event.Event  Cb ) where
  attr OnMousemove eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousemove", value: cb' value }
instance Attr anything OnMousemove  (Effect Unit)  where
  attr OnMousemove value = unsafeAttribute (  
    { key: "mousemove", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMousemove (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnMousemove eventValue = unsafeAttribute (map (map (
    \value -> { key: "mousemove", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnMousemove (Event.Event  (Effect Unit) ) where
  attr OnMousemove eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousemove  (Effect Boolean)  where
  attr OnMousemove value = unsafeAttribute (  
    { key: "mousemove", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMousemove (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnMousemove eventValue = unsafeAttribute (map (map (
    \value -> { key: "mousemove", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnMousemove (Event.Event  (Effect Boolean) ) where
  attr OnMousemove eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const value)) } 
instance Attr everything OnMousemove  Unit  where
  attr OnMousemove _ = unsafeAttribute (  
    { key: "mousemove", value: unset'  } <$ _)
instance Attr everything OnMousemove (Event.Event Unit -> Event.Event  Unit ) where
  attr OnMousemove eventValue = unsafeAttribute (map (map (
    \_ -> { key: "mousemove", value: unset' })) eventValue)
instance Attr everything OnMousemove (Event.Event  Unit ) where
  attr OnMousemove eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mousemove", value: unset' }