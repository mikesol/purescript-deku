module Deku.DOM.Attr.OnCancel where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnCancel = OnCancel
instance Attr anything OnCancel  Cb  where
  attr OnCancel value = unsafeAttribute (  
    { key: "cancel", value: cb' value  } <$ _)
instance Attr anything OnCancel (Event.Event Unit -> Event.Event  Cb ) where
  attr OnCancel eventValue = unsafeAttribute (map (map (
    \value -> { key: "cancel", value: cb' value })) eventValue)
instance Attr anything OnCancel (Event.Event  Cb ) where
  attr OnCancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cancel", value: cb' value }
instance Attr anything OnCancel  (Effect Unit)  where
  attr OnCancel value = unsafeAttribute (  
    { key: "cancel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnCancel (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnCancel eventValue = unsafeAttribute (map (map (
    \value -> { key: "cancel", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnCancel (Event.Event  (Effect Unit) ) where
  attr OnCancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCancel  (Effect Boolean)  where
  attr OnCancel value = unsafeAttribute (  
    { key: "cancel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnCancel (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnCancel eventValue = unsafeAttribute (map (map (
    \value -> { key: "cancel", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnCancel (Event.Event  (Effect Boolean) ) where
  attr OnCancel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const value)) } 
instance Attr everything OnCancel  Unit  where
  attr OnCancel _ = unsafeAttribute (  { key: "cancel", value: unset'  } <$ _)
instance Attr everything OnCancel (Event.Event Unit -> Event.Event  Unit ) where
  attr OnCancel eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "cancel", value: unset' })) eventValue)
instance Attr everything OnCancel (Event.Event  Unit ) where
  attr OnCancel eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "cancel", value: unset' }