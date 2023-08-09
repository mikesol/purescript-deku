module Deku.DOM.Attr.OnKeydown where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnKeydown = OnKeydown
instance Attr anything OnKeydown  Cb  where
  attr OnKeydown value = unsafeAttribute (  
    { key: "keydown", value: cb' value  } <$ _)
instance Attr anything OnKeydown (Event.Event Unit -> Event.Event  Cb ) where
  attr OnKeydown eventValue = unsafeAttribute (map (map (
    \value -> { key: "keydown", value: cb' value })) eventValue)
instance Attr anything OnKeydown (Event.Event  Cb ) where
  attr OnKeydown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keydown", value: cb' value }
instance Attr anything OnKeydown  (Effect Unit)  where
  attr OnKeydown value = unsafeAttribute (  
    { key: "keydown", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnKeydown (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnKeydown eventValue = unsafeAttribute (map (map (
    \value -> { key: "keydown", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnKeydown (Event.Event  (Effect Unit) ) where
  attr OnKeydown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeydown  (Effect Boolean)  where
  attr OnKeydown value = unsafeAttribute (  
    { key: "keydown", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnKeydown (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnKeydown eventValue = unsafeAttribute (map (map (
    \value -> { key: "keydown", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnKeydown (Event.Event  (Effect Boolean) ) where
  attr OnKeydown eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const value)) } 
instance Attr everything OnKeydown  Unit  where
  attr OnKeydown _ = unsafeAttribute (  
    { key: "keydown", value: unset'  } <$ _)
instance Attr everything OnKeydown (Event.Event Unit -> Event.Event  Unit ) where
  attr OnKeydown eventValue = unsafeAttribute (map (map (
    \_ -> { key: "keydown", value: unset' })) eventValue)
instance Attr everything OnKeydown (Event.Event  Unit ) where
  attr OnKeydown eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "keydown", value: unset' }