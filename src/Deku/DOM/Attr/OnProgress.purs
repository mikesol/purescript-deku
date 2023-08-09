module Deku.DOM.Attr.OnProgress where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnProgress = OnProgress
instance Attr anything OnProgress  Cb  where
  attr OnProgress value = unsafeAttribute (  
    { key: "progress", value: cb' value  } <$ _)
instance Attr anything OnProgress (Event.Event Unit -> Event.Event  Cb ) where
  attr OnProgress eventValue = unsafeAttribute (map (map (
    \value -> { key: "progress", value: cb' value })) eventValue)
instance Attr anything OnProgress (Event.Event  Cb ) where
  attr OnProgress eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "progress", value: cb' value }
instance Attr anything OnProgress  (Effect Unit)  where
  attr OnProgress value = unsafeAttribute (  
    { key: "progress", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnProgress (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnProgress eventValue = unsafeAttribute (map (map (
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnProgress (Event.Event  (Effect Unit) ) where
  attr OnProgress eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnProgress  (Effect Boolean)  where
  attr OnProgress value = unsafeAttribute (  
    { key: "progress", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnProgress (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnProgress eventValue = unsafeAttribute (map (map (
    \value -> { key: "progress", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnProgress (Event.Event  (Effect Boolean) ) where
  attr OnProgress eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const value)) } 
instance Attr everything OnProgress  Unit  where
  attr OnProgress _ = unsafeAttribute (  
    { key: "progress", value: unset'  } <$ _)
instance Attr everything OnProgress (Event.Event Unit -> Event.Event  Unit ) where
  attr OnProgress eventValue = unsafeAttribute (map (map (
    \_ -> { key: "progress", value: unset' })) eventValue)
instance Attr everything OnProgress (Event.Event  Unit ) where
  attr OnProgress eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "progress", value: unset' }