module Deku.DOM.Attr.OnMousedown where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnMousedown = OnMousedown
instance Attr anything OnMousedown  Cb  where
  attr OnMousedown value = unsafeAttribute (  
    { key: "mousedown", value: cb' value  } <$ _)
instance Attr anything OnMousedown (Event.Event Unit -> Event.Event  Cb ) where
  attr OnMousedown eventValue = unsafeAttribute (map (map (
    \value -> { key: "mousedown", value: cb' value })) eventValue)
instance Attr anything OnMousedown (Event.Event  Cb ) where
  attr OnMousedown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousedown", value: cb' value }
instance Attr anything OnMousedown  (Effect Unit)  where
  attr OnMousedown value = unsafeAttribute (  
    { key: "mousedown", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMousedown (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnMousedown eventValue = unsafeAttribute (map (map (
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnMousedown (Event.Event  (Effect Unit) ) where
  attr OnMousedown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousedown  (Effect Boolean)  where
  attr OnMousedown value = unsafeAttribute (  
    { key: "mousedown", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMousedown (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnMousedown eventValue = unsafeAttribute (map (map (
    \value -> { key: "mousedown", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnMousedown (Event.Event  (Effect Boolean) ) where
  attr OnMousedown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const value)) } 
instance Attr everything OnMousedown  Unit  where
  attr OnMousedown _ = unsafeAttribute (  
    { key: "mousedown", value: unset'  } <$ _)
instance Attr everything OnMousedown (Event.Event Unit -> Event.Event  Unit ) where
  attr OnMousedown eventValue = unsafeAttribute (map (map (
    \_ -> { key: "mousedown", value: unset' })) eventValue)
instance Attr everything OnMousedown (Event.Event  Unit ) where
  attr OnMousedown eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mousedown", value: unset' }