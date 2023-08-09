module Deku.DOM.Attr.OnDrag where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnDrag = OnDrag
instance Attr anything OnDrag  Cb  where
  attr OnDrag value = unsafeAttribute (  
    { key: "drag", value: cb' value  } <$ _)
instance Attr anything OnDrag (Event.Event Unit -> Event.Event  Cb ) where
  attr OnDrag eventValue = unsafeAttribute (map (map (
    \value -> { key: "drag", value: cb' value })) eventValue)
instance Attr anything OnDrag (Event.Event  Cb ) where
  attr OnDrag eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "drag", value: cb' value }
instance Attr anything OnDrag  (Effect Unit)  where
  attr OnDrag value = unsafeAttribute (  
    { key: "drag", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDrag (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnDrag eventValue = unsafeAttribute (map (map (
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnDrag (Event.Event  (Effect Unit) ) where
  attr OnDrag eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrag  (Effect Boolean)  where
  attr OnDrag value = unsafeAttribute (  
    { key: "drag", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDrag (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnDrag eventValue = unsafeAttribute (map (map (
    \value -> { key: "drag", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnDrag (Event.Event  (Effect Boolean) ) where
  attr OnDrag eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const value)) } 
instance Attr everything OnDrag  Unit  where
  attr OnDrag _ = unsafeAttribute (  { key: "drag", value: unset'  } <$ _)
instance Attr everything OnDrag (Event.Event Unit -> Event.Event  Unit ) where
  attr OnDrag eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "drag", value: unset' })) eventValue)
instance Attr everything OnDrag (Event.Event  Unit ) where
  attr OnDrag eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "drag", value: unset' }