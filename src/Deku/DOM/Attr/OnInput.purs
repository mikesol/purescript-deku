module Deku.DOM.Attr.OnInput where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnInput = OnInput
instance Attr anything OnInput  Cb  where
  attr OnInput value = unsafeAttribute (  
    { key: "input", value: cb' value  } <$ _)
instance Attr anything OnInput (Event.Event Unit -> Event.Event  Cb ) where
  attr OnInput eventValue = unsafeAttribute (map (map (
    \value -> { key: "input", value: cb' value })) eventValue)
instance Attr anything OnInput (Event.Event  Cb ) where
  attr OnInput eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "input", value: cb' value }
instance Attr anything OnInput  (Effect Unit)  where
  attr OnInput value = unsafeAttribute (  
    { key: "input", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnInput (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnInput eventValue = unsafeAttribute (map (map (
    \value -> { key: "input", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnInput (Event.Event  (Effect Unit) ) where
  attr OnInput eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInput  (Effect Boolean)  where
  attr OnInput value = unsafeAttribute (  
    { key: "input", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnInput (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnInput eventValue = unsafeAttribute (map (map (
    \value -> { key: "input", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnInput (Event.Event  (Effect Boolean) ) where
  attr OnInput eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const value)) } 
instance Attr everything OnInput  Unit  where
  attr OnInput _ = unsafeAttribute (  { key: "input", value: unset'  } <$ _)
instance Attr everything OnInput (Event.Event Unit -> Event.Event  Unit ) where
  attr OnInput eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "input", value: unset' })) eventValue)
instance Attr everything OnInput (Event.Event  Unit ) where
  attr OnInput eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "input", value: unset' }