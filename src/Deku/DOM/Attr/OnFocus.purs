module Deku.DOM.Attr.OnFocus where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnFocus = OnFocus
instance Attr anything OnFocus  Cb  where
  attr OnFocus value = unsafeAttribute (  
    { key: "focus", value: cb' value  } <$ _)
instance Attr anything OnFocus (Event.Event Unit -> Event.Event  Cb ) where
  attr OnFocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "focus", value: cb' value })) eventValue)
instance Attr anything OnFocus (Event.Event  Cb ) where
  attr OnFocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "focus", value: cb' value }
instance Attr anything OnFocus  (Effect Unit)  where
  attr OnFocus value = unsafeAttribute (  
    { key: "focus", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnFocus (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnFocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnFocus (Event.Event  (Effect Unit) ) where
  attr OnFocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFocus  (Effect Boolean)  where
  attr OnFocus value = unsafeAttribute (  
    { key: "focus", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnFocus (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnFocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "focus", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnFocus (Event.Event  (Effect Boolean) ) where
  attr OnFocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const value)) } 
instance Attr everything OnFocus  Unit  where
  attr OnFocus _ = unsafeAttribute (  { key: "focus", value: unset'  } <$ _)
instance Attr everything OnFocus (Event.Event Unit -> Event.Event  Unit ) where
  attr OnFocus eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "focus", value: unset' })) eventValue)
instance Attr everything OnFocus (Event.Event  Unit ) where
  attr OnFocus eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "focus", value: unset' }