module Deku.DOM.Attr.OnTimeupdate where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate  Cb  where
  attr OnTimeupdate value = unsafeAttribute (  
    { key: "timeupdate", value: cb' value  } <$ _)
instance Attr anything OnTimeupdate (Event.Event  Cb ) where
  attr OnTimeupdate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "timeupdate", value: cb' value }


instance Attr anything OnTimeupdate  (Effect Unit)  where
  attr OnTimeupdate value = unsafeAttribute (  
    { key: "timeupdate", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTimeupdate (Event.Event  (Effect Unit) ) where
  attr OnTimeupdate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTimeupdate  (Effect Boolean)  where
  attr OnTimeupdate value = unsafeAttribute (  
    { key: "timeupdate", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTimeupdate (Event.Event  (Effect Boolean) ) where
  attr OnTimeupdate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const value)) } 


instance Attr everything OnTimeupdate  Unit  where
  attr OnTimeupdate _ = unsafeAttribute (  
    { key: "timeupdate", value: unset'  } <$ _)
instance Attr everything OnTimeupdate (Event.Event  Unit ) where
  attr OnTimeupdate eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "timeupdate", value: unset' }
