module Deku.DOM.Attr.OnPointercancel where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPointercancel = OnPointercancel
instance Attr anything OnPointercancel  Cb  where
  attr OnPointercancel value = unsafeAttribute (  
    { key: "pointercancel", value: cb' value  } <$ _)
instance Attr anything OnPointercancel (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPointercancel eventValue = unsafeAttribute (map (map ( \value -> { key: "pointercancel", value: cb' value })) eventValue)
instance Attr anything OnPointercancel (Event.Event  Cb ) where
  attr OnPointercancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "pointercancel", value: cb' value }
instance Attr anything OnPointercancel  (Effect Unit)  where
  attr OnPointercancel value = unsafeAttribute (  
    { key: "pointercancel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointercancel (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPointercancel eventValue = unsafeAttribute (map (map ( \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPointercancel (Event.Event  (Effect Unit) ) where
  attr OnPointercancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointercancel  (Effect Boolean)  where
  attr OnPointercancel value = unsafeAttribute (  
    { key: "pointercancel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointercancel (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPointercancel eventValue = unsafeAttribute (map (map ( \value -> { key: "pointercancel", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPointercancel (Event.Event  (Effect Boolean) ) where
  attr OnPointercancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "pointercancel", value: cb' (Cb (const value)) } 
instance Attr everything OnPointercancel  Unit  where
  attr OnPointercancel _ = unsafeAttribute (  
    { key: "pointercancel", value: unset'  } <$ _)
instance Attr everything OnPointercancel (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPointercancel eventValue = unsafeAttribute (map (map ( \_ -> { key: "pointercancel", value: unset' })) eventValue)
instance Attr everything OnPointercancel (Event.Event  Unit ) where
  attr OnPointercancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "pointercancel", value: unset' }