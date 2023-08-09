module Deku.DOM.Attr.OnChange where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnChange = OnChange
instance Attr anything OnChange  Cb  where
  attr OnChange value = unsafeAttribute (  
    { key: "change", value: cb' value  } <$ _)
instance Attr anything OnChange (Event.Event Unit -> Event.Event  Cb ) where
  attr OnChange eventValue = unsafeAttribute (map (map (
    \value -> { key: "change", value: cb' value })) eventValue)
instance Attr anything OnChange (Event.Event  Cb ) where
  attr OnChange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "change", value: cb' value }
instance Attr anything OnChange  (Effect Unit)  where
  attr OnChange value = unsafeAttribute (  
    { key: "change", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnChange (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnChange eventValue = unsafeAttribute (map (map (
    \value -> { key: "change", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnChange (Event.Event  (Effect Unit) ) where
  attr OnChange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnChange  (Effect Boolean)  where
  attr OnChange value = unsafeAttribute (  
    { key: "change", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnChange (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnChange eventValue = unsafeAttribute (map (map (
    \value -> { key: "change", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnChange (Event.Event  (Effect Boolean) ) where
  attr OnChange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const value)) } 
instance Attr everything OnChange  Unit  where
  attr OnChange _ = unsafeAttribute (  { key: "change", value: unset'  } <$ _)
instance Attr everything OnChange (Event.Event Unit -> Event.Event  Unit ) where
  attr OnChange eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "change", value: unset' })) eventValue)
instance Attr everything OnChange (Event.Event  Unit ) where
  attr OnChange eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "change", value: unset' }