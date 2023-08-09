module Deku.DOM.Attr.OnDragover where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnDragover = OnDragover
instance Attr anything OnDragover  Cb  where
  attr OnDragover value = unsafeAttribute (  
    { key: "dragover", value: cb' value  } <$ _)
instance Attr anything OnDragover (Event.Event Unit -> Event.Event  Cb ) where
  attr OnDragover eventValue = unsafeAttribute (map (map (
    \value -> { key: "dragover", value: cb' value })) eventValue)
instance Attr anything OnDragover (Event.Event  Cb ) where
  attr OnDragover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragover", value: cb' value }
instance Attr anything OnDragover  (Effect Unit)  where
  attr OnDragover value = unsafeAttribute (  
    { key: "dragover", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDragover (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnDragover eventValue = unsafeAttribute (map (map (
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnDragover (Event.Event  (Effect Unit) ) where
  attr OnDragover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragover  (Effect Boolean)  where
  attr OnDragover value = unsafeAttribute (  
    { key: "dragover", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDragover (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnDragover eventValue = unsafeAttribute (map (map (
    \value -> { key: "dragover", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnDragover (Event.Event  (Effect Boolean) ) where
  attr OnDragover eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const value)) } 
instance Attr everything OnDragover  Unit  where
  attr OnDragover _ = unsafeAttribute (  
    { key: "dragover", value: unset'  } <$ _)
instance Attr everything OnDragover (Event.Event Unit -> Event.Event  Unit ) where
  attr OnDragover eventValue = unsafeAttribute (map (map (
    \_ -> { key: "dragover", value: unset' })) eventValue)
instance Attr everything OnDragover (Event.Event  Unit ) where
  attr OnDragover eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "dragover", value: unset' }