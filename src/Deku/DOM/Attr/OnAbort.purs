module Deku.DOM.Attr.OnAbort where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnAbort = OnAbort
instance Attr anything OnAbort  Cb  where
  attr OnAbort value = unsafeAttribute (  
    { key: "abort", value: cb' value  } <$ _)
instance Attr anything OnAbort (Event.Event Unit -> Event.Event  Cb ) where
  attr OnAbort eventValue = unsafeAttribute (map (map (
    \value -> { key: "abort", value: cb' value })) eventValue)
instance Attr anything OnAbort (Event.Event  Cb ) where
  attr OnAbort eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "abort", value: cb' value }
instance Attr anything OnAbort  (Effect Unit)  where
  attr OnAbort value = unsafeAttribute (  
    { key: "abort", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnAbort (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnAbort eventValue = unsafeAttribute (map (map (
    \value -> { key: "abort", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnAbort (Event.Event  (Effect Unit) ) where
  attr OnAbort eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAbort  (Effect Boolean)  where
  attr OnAbort value = unsafeAttribute (  
    { key: "abort", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnAbort (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnAbort eventValue = unsafeAttribute (map (map (
    \value -> { key: "abort", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnAbort (Event.Event  (Effect Boolean) ) where
  attr OnAbort eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const value)) } 
instance Attr everything OnAbort  Unit  where
  attr OnAbort _ = unsafeAttribute (  { key: "abort", value: unset'  } <$ _)
instance Attr everything OnAbort (Event.Event Unit -> Event.Event  Unit ) where
  attr OnAbort eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "abort", value: unset' })) eventValue)
instance Attr everything OnAbort (Event.Event  Unit ) where
  attr OnAbort eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "abort", value: unset' }