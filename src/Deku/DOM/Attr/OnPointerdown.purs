module Deku.DOM.Attr.OnPointerdown where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPointerdown = OnPointerdown
instance Attr anything OnPointerdown  Cb  where
  attr OnPointerdown value = unsafeAttribute (  
    { key: "pointerdown", value: cb' value  } <$ _)
instance Attr anything OnPointerdown (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPointerdown eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerdown", value: cb' value })) eventValue)
instance Attr anything OnPointerdown (Event.Event  Cb ) where
  attr OnPointerdown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerdown", value: cb' value }
instance Attr anything OnPointerdown  (Effect Unit)  where
  attr OnPointerdown value = unsafeAttribute (  
    { key: "pointerdown", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerdown (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPointerdown eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerdown", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPointerdown (Event.Event  (Effect Unit) ) where
  attr OnPointerdown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerdown  (Effect Boolean)  where
  attr OnPointerdown value = unsafeAttribute (  
    { key: "pointerdown", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerdown (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPointerdown eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerdown", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPointerdown (Event.Event  (Effect Boolean) ) where
  attr OnPointerdown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const value)) } 
instance Attr everything OnPointerdown  Unit  where
  attr OnPointerdown _ = unsafeAttribute (  
    { key: "pointerdown", value: unset'  } <$ _)
instance Attr everything OnPointerdown (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPointerdown eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointerdown", value: unset' })) eventValue)
instance Attr everything OnPointerdown (Event.Event  Unit ) where
  attr OnPointerdown eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointerdown", value: unset' }