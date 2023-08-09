module Deku.DOM.Attr.OnFormdata where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnFormdata = OnFormdata
instance Attr anything OnFormdata  Cb  where
  attr OnFormdata value = unsafeAttribute (  
    { key: "formdata", value: cb' value  } <$ _)
instance Attr anything OnFormdata (Event.Event Unit -> Event.Event  Cb ) where
  attr OnFormdata eventValue = unsafeAttribute (map (map (
    \value -> { key: "formdata", value: cb' value })) eventValue)
instance Attr anything OnFormdata (Event.Event  Cb ) where
  attr OnFormdata eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formdata", value: cb' value }
instance Attr anything OnFormdata  (Effect Unit)  where
  attr OnFormdata value = unsafeAttribute (  
    { key: "formdata", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnFormdata (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnFormdata eventValue = unsafeAttribute (map (map (
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnFormdata (Event.Event  (Effect Unit) ) where
  attr OnFormdata eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFormdata  (Effect Boolean)  where
  attr OnFormdata value = unsafeAttribute (  
    { key: "formdata", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnFormdata (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnFormdata eventValue = unsafeAttribute (map (map (
    \value -> { key: "formdata", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnFormdata (Event.Event  (Effect Boolean) ) where
  attr OnFormdata eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const value)) } 
instance Attr everything OnFormdata  Unit  where
  attr OnFormdata _ = unsafeAttribute (  
    { key: "formdata", value: unset'  } <$ _)
instance Attr everything OnFormdata (Event.Event Unit -> Event.Event  Unit ) where
  attr OnFormdata eventValue = unsafeAttribute (map (map (
    \_ -> { key: "formdata", value: unset' })) eventValue)
instance Attr everything OnFormdata (Event.Event  Unit ) where
  attr OnFormdata eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "formdata", value: unset' }