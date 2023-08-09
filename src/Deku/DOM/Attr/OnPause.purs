module Deku.DOM.Attr.OnPause where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPause = OnPause
instance Attr anything OnPause  Cb  where
  attr OnPause value = unsafeAttribute (  
    { key: "pause", value: cb' value  } <$ _)
instance Attr anything OnPause (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPause eventValue = unsafeAttribute (map (map (
    \value -> { key: "pause", value: cb' value })) eventValue)
instance Attr anything OnPause (Event.Event  Cb ) where
  attr OnPause eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pause", value: cb' value }
instance Attr anything OnPause  (Effect Unit)  where
  attr OnPause value = unsafeAttribute (  
    { key: "pause", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPause (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPause eventValue = unsafeAttribute (map (map (
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPause (Event.Event  (Effect Unit) ) where
  attr OnPause eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPause  (Effect Boolean)  where
  attr OnPause value = unsafeAttribute (  
    { key: "pause", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPause (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPause eventValue = unsafeAttribute (map (map (
    \value -> { key: "pause", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPause (Event.Event  (Effect Boolean) ) where
  attr OnPause eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const value)) } 
instance Attr everything OnPause  Unit  where
  attr OnPause _ = unsafeAttribute (  { key: "pause", value: unset'  } <$ _)
instance Attr everything OnPause (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPause eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "pause", value: unset' })) eventValue)
instance Attr everything OnPause (Event.Event  Unit ) where
  attr OnPause eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "pause", value: unset' }