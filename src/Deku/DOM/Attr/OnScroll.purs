module Deku.DOM.Attr.OnScroll where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnScroll = OnScroll
instance Attr anything OnScroll  Cb  where
  attr OnScroll value = unsafeAttribute (  
    { key: "scroll", value: cb' value  } <$ _)
instance Attr anything OnScroll (Event.Event Unit -> Event.Event  Cb ) where
  attr OnScroll eventValue = unsafeAttribute (map (map (
    \value -> { key: "scroll", value: cb' value })) eventValue)
instance Attr anything OnScroll (Event.Event  Cb ) where
  attr OnScroll eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "scroll", value: cb' value }
instance Attr anything OnScroll  (Effect Unit)  where
  attr OnScroll value = unsafeAttribute (  
    { key: "scroll", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnScroll (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnScroll eventValue = unsafeAttribute (map (map (
    \value -> { key: "scroll", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnScroll (Event.Event  (Effect Unit) ) where
  attr OnScroll eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnScroll  (Effect Boolean)  where
  attr OnScroll value = unsafeAttribute (  
    { key: "scroll", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnScroll (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnScroll eventValue = unsafeAttribute (map (map (
    \value -> { key: "scroll", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnScroll (Event.Event  (Effect Boolean) ) where
  attr OnScroll eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const value)) } 
instance Attr everything OnScroll  Unit  where
  attr OnScroll _ = unsafeAttribute (  { key: "scroll", value: unset'  } <$ _)
instance Attr everything OnScroll (Event.Event Unit -> Event.Event  Unit ) where
  attr OnScroll eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "scroll", value: unset' })) eventValue)
instance Attr everything OnScroll (Event.Event  Unit ) where
  attr OnScroll eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "scroll", value: unset' }