module Deku.DOM.Attr.OnLoadstart where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnLoadstart = OnLoadstart
instance Attr anything OnLoadstart  Cb  where
  attr OnLoadstart value = unsafeAttribute (  
    { key: "loadstart", value: cb' value  } <$ _)
instance Attr anything OnLoadstart (Event.Event Unit -> Event.Event  Cb ) where
  attr OnLoadstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "loadstart", value: cb' value })) eventValue)
instance Attr anything OnLoadstart (Event.Event  Cb ) where
  attr OnLoadstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadstart", value: cb' value }
instance Attr anything OnLoadstart  (Effect Unit)  where
  attr OnLoadstart value = unsafeAttribute (  
    { key: "loadstart", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnLoadstart (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnLoadstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "loadstart", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnLoadstart (Event.Event  (Effect Unit) ) where
  attr OnLoadstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadstart  (Effect Boolean)  where
  attr OnLoadstart value = unsafeAttribute (  
    { key: "loadstart", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnLoadstart (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnLoadstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "loadstart", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnLoadstart (Event.Event  (Effect Boolean) ) where
  attr OnLoadstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const value)) } 
instance Attr everything OnLoadstart  Unit  where
  attr OnLoadstart _ = unsafeAttribute (  
    { key: "loadstart", value: unset'  } <$ _)
instance Attr everything OnLoadstart (Event.Event Unit -> Event.Event  Unit ) where
  attr OnLoadstart eventValue = unsafeAttribute (map (map (
    \_ -> { key: "loadstart", value: unset' })) eventValue)
instance Attr everything OnLoadstart (Event.Event  Unit ) where
  attr OnLoadstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "loadstart", value: unset' }