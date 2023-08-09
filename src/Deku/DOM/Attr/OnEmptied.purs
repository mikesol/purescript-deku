module Deku.DOM.Attr.OnEmptied where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnEmptied = OnEmptied
instance Attr anything OnEmptied  Cb  where
  attr OnEmptied value = unsafeAttribute (  
    { key: "emptied", value: cb' value  } <$ _)
instance Attr anything OnEmptied (Event.Event Unit -> Event.Event  Cb ) where
  attr OnEmptied eventValue = unsafeAttribute (map (map (
    \value -> { key: "emptied", value: cb' value })) eventValue)
instance Attr anything OnEmptied (Event.Event  Cb ) where
  attr OnEmptied eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "emptied", value: cb' value }
instance Attr anything OnEmptied  (Effect Unit)  where
  attr OnEmptied value = unsafeAttribute (  
    { key: "emptied", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnEmptied (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnEmptied eventValue = unsafeAttribute (map (map (
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnEmptied (Event.Event  (Effect Unit) ) where
  attr OnEmptied eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEmptied  (Effect Boolean)  where
  attr OnEmptied value = unsafeAttribute (  
    { key: "emptied", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnEmptied (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnEmptied eventValue = unsafeAttribute (map (map (
    \value -> { key: "emptied", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnEmptied (Event.Event  (Effect Boolean) ) where
  attr OnEmptied eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const value)) } 
instance Attr everything OnEmptied  Unit  where
  attr OnEmptied _ = unsafeAttribute (  
    { key: "emptied", value: unset'  } <$ _)
instance Attr everything OnEmptied (Event.Event Unit -> Event.Event  Unit ) where
  attr OnEmptied eventValue = unsafeAttribute (map (map (
    \_ -> { key: "emptied", value: unset' })) eventValue)
instance Attr everything OnEmptied (Event.Event  Unit ) where
  attr OnEmptied eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "emptied", value: unset' }