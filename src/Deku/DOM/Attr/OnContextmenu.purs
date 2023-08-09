module Deku.DOM.Attr.OnContextmenu where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnContextmenu = OnContextmenu
instance Attr anything OnContextmenu  Cb  where
  attr OnContextmenu value = unsafeAttribute (  
    { key: "contextmenu", value: cb' value  } <$ _)
instance Attr anything OnContextmenu (Event.Event Unit -> Event.Event  Cb ) where
  attr OnContextmenu eventValue = unsafeAttribute (map (map (
    \value -> { key: "contextmenu", value: cb' value })) eventValue)
instance Attr anything OnContextmenu (Event.Event  Cb ) where
  attr OnContextmenu eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "contextmenu", value: cb' value }
instance Attr anything OnContextmenu  (Effect Unit)  where
  attr OnContextmenu value = unsafeAttribute (  
    { key: "contextmenu", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnContextmenu (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnContextmenu eventValue = unsafeAttribute (map (map (
    \value -> { key: "contextmenu", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnContextmenu (Event.Event  (Effect Unit) ) where
  attr OnContextmenu eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnContextmenu  (Effect Boolean)  where
  attr OnContextmenu value = unsafeAttribute (  
    { key: "contextmenu", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnContextmenu (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnContextmenu eventValue = unsafeAttribute (map (map (
    \value -> { key: "contextmenu", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnContextmenu (Event.Event  (Effect Boolean) ) where
  attr OnContextmenu eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const value)) } 
instance Attr everything OnContextmenu  Unit  where
  attr OnContextmenu _ = unsafeAttribute (  
    { key: "contextmenu", value: unset'  } <$ _)
instance Attr everything OnContextmenu (Event.Event Unit -> Event.Event  Unit ) where
  attr OnContextmenu eventValue = unsafeAttribute (map (map (
    \_ -> { key: "contextmenu", value: unset' })) eventValue)
instance Attr everything OnContextmenu (Event.Event  Unit ) where
  attr OnContextmenu eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "contextmenu", value: unset' }