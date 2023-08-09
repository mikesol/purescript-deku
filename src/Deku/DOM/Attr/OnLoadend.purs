module Deku.DOM.Attr.OnLoadend where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnLoadend = OnLoadend
instance Attr anything OnLoadend  Cb  where
  attr OnLoadend value = unsafeAttribute (  
    { key: "loadend", value: cb' value  } <$ _)
instance Attr anything OnLoadend (Event.Event Unit -> Event.Event  Cb ) where
  attr OnLoadend eventValue = unsafeAttribute (map (map (
    \value -> { key: "loadend", value: cb' value })) eventValue)
instance Attr anything OnLoadend (Event.Event  Cb ) where
  attr OnLoadend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadend", value: cb' value }
instance Attr anything OnLoadend  (Effect Unit)  where
  attr OnLoadend value = unsafeAttribute (  
    { key: "loadend", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnLoadend (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnLoadend eventValue = unsafeAttribute (map (map (
    \value -> { key: "loadend", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnLoadend (Event.Event  (Effect Unit) ) where
  attr OnLoadend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadend  (Effect Boolean)  where
  attr OnLoadend value = unsafeAttribute (  
    { key: "loadend", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnLoadend (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnLoadend eventValue = unsafeAttribute (map (map (
    \value -> { key: "loadend", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnLoadend (Event.Event  (Effect Boolean) ) where
  attr OnLoadend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const value)) } 
instance Attr everything OnLoadend  Unit  where
  attr OnLoadend _ = unsafeAttribute (  
    { key: "loadend", value: unset'  } <$ _)
instance Attr everything OnLoadend (Event.Event Unit -> Event.Event  Unit ) where
  attr OnLoadend eventValue = unsafeAttribute (map (map (
    \_ -> { key: "loadend", value: unset' })) eventValue)
instance Attr everything OnLoadend (Event.Event  Unit ) where
  attr OnLoadend eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "loadend", value: unset' }