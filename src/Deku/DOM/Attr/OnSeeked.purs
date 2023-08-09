module Deku.DOM.Attr.OnSeeked where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnSeeked = OnSeeked
instance Attr anything OnSeeked  Cb  where
  attr OnSeeked value = unsafeAttribute (  
    { key: "seeked", value: cb' value  } <$ _)
instance Attr anything OnSeeked (Event.Event Unit -> Event.Event  Cb ) where
  attr OnSeeked eventValue = unsafeAttribute (map (map (
    \value -> { key: "seeked", value: cb' value })) eventValue)
instance Attr anything OnSeeked (Event.Event  Cb ) where
  attr OnSeeked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "seeked", value: cb' value }
instance Attr anything OnSeeked  (Effect Unit)  where
  attr OnSeeked value = unsafeAttribute (  
    { key: "seeked", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSeeked (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnSeeked eventValue = unsafeAttribute (map (map (
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnSeeked (Event.Event  (Effect Unit) ) where
  attr OnSeeked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeked  (Effect Boolean)  where
  attr OnSeeked value = unsafeAttribute (  
    { key: "seeked", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSeeked (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnSeeked eventValue = unsafeAttribute (map (map (
    \value -> { key: "seeked", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnSeeked (Event.Event  (Effect Boolean) ) where
  attr OnSeeked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const value)) } 
instance Attr everything OnSeeked  Unit  where
  attr OnSeeked _ = unsafeAttribute (  { key: "seeked", value: unset'  } <$ _)
instance Attr everything OnSeeked (Event.Event Unit -> Event.Event  Unit ) where
  attr OnSeeked eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "seeked", value: unset' })) eventValue)
instance Attr everything OnSeeked (Event.Event  Unit ) where
  attr OnSeeked eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "seeked", value: unset' }