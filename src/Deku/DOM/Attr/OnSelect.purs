module Deku.DOM.Attr.OnSelect where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnSelect = OnSelect
instance Attr anything OnSelect  Cb  where
  attr OnSelect value = unsafeAttribute (  
    { key: "select", value: cb' value  } <$ _)
instance Attr anything OnSelect (Event.Event Unit -> Event.Event  Cb ) where
  attr OnSelect eventValue = unsafeAttribute (map (map (
    \value -> { key: "select", value: cb' value })) eventValue)
instance Attr anything OnSelect (Event.Event  Cb ) where
  attr OnSelect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "select", value: cb' value }
instance Attr anything OnSelect  (Effect Unit)  where
  attr OnSelect value = unsafeAttribute (  
    { key: "select", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSelect (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnSelect eventValue = unsafeAttribute (map (map (
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnSelect (Event.Event  (Effect Unit) ) where
  attr OnSelect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelect  (Effect Boolean)  where
  attr OnSelect value = unsafeAttribute (  
    { key: "select", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSelect (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnSelect eventValue = unsafeAttribute (map (map (
    \value -> { key: "select", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnSelect (Event.Event  (Effect Boolean) ) where
  attr OnSelect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const value)) } 
instance Attr everything OnSelect  Unit  where
  attr OnSelect _ = unsafeAttribute (  { key: "select", value: unset'  } <$ _)
instance Attr everything OnSelect (Event.Event Unit -> Event.Event  Unit ) where
  attr OnSelect eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "select", value: unset' })) eventValue)
instance Attr everything OnSelect (Event.Event  Unit ) where
  attr OnSelect eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "select", value: unset' }