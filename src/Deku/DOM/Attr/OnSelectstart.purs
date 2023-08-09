module Deku.DOM.Attr.OnSelectstart where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnSelectstart = OnSelectstart
instance Attr anything OnSelectstart  Cb  where
  attr OnSelectstart value = unsafeAttribute (  
    { key: "selectstart", value: cb' value  } <$ _)
instance Attr anything OnSelectstart (Event.Event Unit -> Event.Event  Cb ) where
  attr OnSelectstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "selectstart", value: cb' value })) eventValue)
instance Attr anything OnSelectstart (Event.Event  Cb ) where
  attr OnSelectstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "selectstart", value: cb' value }
instance Attr anything OnSelectstart  (Effect Unit)  where
  attr OnSelectstart value = unsafeAttribute (  
    { key: "selectstart", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSelectstart (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnSelectstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnSelectstart (Event.Event  (Effect Unit) ) where
  attr OnSelectstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectstart  (Effect Boolean)  where
  attr OnSelectstart value = unsafeAttribute (  
    { key: "selectstart", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSelectstart (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnSelectstart eventValue = unsafeAttribute (map (map (
    \value -> { key: "selectstart", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnSelectstart (Event.Event  (Effect Boolean) ) where
  attr OnSelectstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const value)) } 
instance Attr everything OnSelectstart  Unit  where
  attr OnSelectstart _ = unsafeAttribute (  
    { key: "selectstart", value: unset'  } <$ _)
instance Attr everything OnSelectstart (Event.Event Unit -> Event.Event  Unit ) where
  attr OnSelectstart eventValue = unsafeAttribute (map (map (
    \_ -> { key: "selectstart", value: unset' })) eventValue)
instance Attr everything OnSelectstart (Event.Event  Unit ) where
  attr OnSelectstart eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "selectstart", value: unset' }