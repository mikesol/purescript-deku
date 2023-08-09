module Deku.DOM.Attr.OnWheel where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnWheel = OnWheel
instance Attr anything OnWheel  Cb  where
  attr OnWheel value = unsafeAttribute (  
    { key: "wheel", value: cb' value  } <$ _)
instance Attr anything OnWheel (Event.Event Unit -> Event.Event  Cb ) where
  attr OnWheel eventValue = unsafeAttribute (map (map (
    \value -> { key: "wheel", value: cb' value })) eventValue)
instance Attr anything OnWheel (Event.Event  Cb ) where
  attr OnWheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "wheel", value: cb' value }
instance Attr anything OnWheel  (Effect Unit)  where
  attr OnWheel value = unsafeAttribute (  
    { key: "wheel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnWheel (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnWheel eventValue = unsafeAttribute (map (map (
    \value -> { key: "wheel", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnWheel (Event.Event  (Effect Unit) ) where
  attr OnWheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWheel  (Effect Boolean)  where
  attr OnWheel value = unsafeAttribute (  
    { key: "wheel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnWheel (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnWheel eventValue = unsafeAttribute (map (map (
    \value -> { key: "wheel", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnWheel (Event.Event  (Effect Boolean) ) where
  attr OnWheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const value)) } 
instance Attr everything OnWheel  Unit  where
  attr OnWheel _ = unsafeAttribute  ({ key: "wheel", value: unset' } <$ _)
instance Attr everything OnWheel (Event.Event Unit -> Event.Event  Unit ) where
  attr OnWheel eventValue = unsafeAttribute (map (map ( \_ -> 
    { key: "wheel", value: unset' })) eventValue)
instance Attr everything OnWheel (Event.Event  Unit ) where
  attr OnWheel eventValue = unsafeAttribute \_ -> eventValue <#> \_ -> 
    { key: "wheel", value: unset' }