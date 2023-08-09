module Deku.DOM.Attr.OnPointermove where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPointermove = OnPointermove
instance Attr anything OnPointermove  Cb  where
  attr OnPointermove value = unsafeAttribute (  
    { key: "pointermove", value: cb' value  } <$ _)
instance Attr anything OnPointermove (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPointermove eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointermove", value: cb' value })) eventValue)
instance Attr anything OnPointermove (Event.Event  Cb ) where
  attr OnPointermove eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointermove", value: cb' value }
instance Attr anything OnPointermove  (Effect Unit)  where
  attr OnPointermove value = unsafeAttribute (  
    { key: "pointermove", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointermove (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPointermove eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPointermove (Event.Event  (Effect Unit) ) where
  attr OnPointermove eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointermove  (Effect Boolean)  where
  attr OnPointermove value = unsafeAttribute (  
    { key: "pointermove", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointermove (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPointermove eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointermove", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPointermove (Event.Event  (Effect Boolean) ) where
  attr OnPointermove eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const value)) } 
instance Attr everything OnPointermove  Unit  where
  attr OnPointermove _ = unsafeAttribute (  
    { key: "pointermove", value: unset'  } <$ _)
instance Attr everything OnPointermove (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPointermove eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointermove", value: unset' })) eventValue)
instance Attr everything OnPointermove (Event.Event  Unit ) where
  attr OnPointermove eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointermove", value: unset' }