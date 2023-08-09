module Deku.DOM.Attr.OnDragenter where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnDragenter = OnDragenter
instance Attr anything OnDragenter  Cb  where
  attr OnDragenter value = unsafeAttribute (  
    { key: "dragenter", value: cb' value  } <$ _)
instance Attr anything OnDragenter (Event.Event Unit -> Event.Event  Cb ) where
  attr OnDragenter eventValue = unsafeAttribute (map (map (
    \value -> { key: "dragenter", value: cb' value })) eventValue)
instance Attr anything OnDragenter (Event.Event  Cb ) where
  attr OnDragenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragenter", value: cb' value }
instance Attr anything OnDragenter  (Effect Unit)  where
  attr OnDragenter value = unsafeAttribute (  
    { key: "dragenter", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDragenter (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnDragenter eventValue = unsafeAttribute (map (map (
    \value -> { key: "dragenter", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnDragenter (Event.Event  (Effect Unit) ) where
  attr OnDragenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragenter  (Effect Boolean)  where
  attr OnDragenter value = unsafeAttribute (  
    { key: "dragenter", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDragenter (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnDragenter eventValue = unsafeAttribute (map (map (
    \value -> { key: "dragenter", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnDragenter (Event.Event  (Effect Boolean) ) where
  attr OnDragenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const value)) } 
instance Attr everything OnDragenter  Unit  where
  attr OnDragenter _ = unsafeAttribute (  
    { key: "dragenter", value: unset'  } <$ _)
instance Attr everything OnDragenter (Event.Event Unit -> Event.Event  Unit ) where
  attr OnDragenter eventValue = unsafeAttribute (map (map (
    \_ -> { key: "dragenter", value: unset' })) eventValue)
instance Attr everything OnDragenter (Event.Event  Unit ) where
  attr OnDragenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "dragenter", value: unset' }