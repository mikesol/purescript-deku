module Deku.DOM.Attr.OnKeyup where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnKeyup = OnKeyup
instance Attr anything OnKeyup  Cb  where
  attr OnKeyup value = unsafeAttribute (  
    { key: "keyup", value: cb' value  } <$ _)
instance Attr anything OnKeyup (Event.Event Unit -> Event.Event  Cb ) where
  attr OnKeyup eventValue = unsafeAttribute (map (map (
    \value -> { key: "keyup", value: cb' value })) eventValue)
instance Attr anything OnKeyup (Event.Event  Cb ) where
  attr OnKeyup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keyup", value: cb' value }
instance Attr anything OnKeyup  (Effect Unit)  where
  attr OnKeyup value = unsafeAttribute (  
    { key: "keyup", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnKeyup (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnKeyup eventValue = unsafeAttribute (map (map (
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnKeyup (Event.Event  (Effect Unit) ) where
  attr OnKeyup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeyup  (Effect Boolean)  where
  attr OnKeyup value = unsafeAttribute (  
    { key: "keyup", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnKeyup (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnKeyup eventValue = unsafeAttribute (map (map (
    \value -> { key: "keyup", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnKeyup (Event.Event  (Effect Boolean) ) where
  attr OnKeyup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const value)) } 
instance Attr everything OnKeyup  Unit  where
  attr OnKeyup _ = unsafeAttribute (  { key: "keyup", value: unset'  } <$ _)
instance Attr everything OnKeyup (Event.Event Unit -> Event.Event  Unit ) where
  attr OnKeyup eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "keyup", value: unset' })) eventValue)
instance Attr everything OnKeyup (Event.Event  Unit ) where
  attr OnKeyup eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "keyup", value: unset' }