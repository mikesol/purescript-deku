module Deku.DOM.Attr.OnDragleave where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDragleave = OnDragleave

instance Attr anything OnDragleave  Cb  where
  attr OnDragleave value = unsafeAttribute (  
    { key: "dragleave", value: cb' value  } <$ _)
instance Attr anything OnDragleave (Event.Event  Cb ) where
  attr OnDragleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragleave", value: cb' value }


instance Attr anything OnDragleave  (Effect Unit)  where
  attr OnDragleave value = unsafeAttribute (  
    { key: "dragleave", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDragleave (Event.Event  (Effect Unit) ) where
  attr OnDragleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragleave  (Effect Boolean)  where
  attr OnDragleave value = unsafeAttribute (  
    { key: "dragleave", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDragleave (Event.Event  (Effect Boolean) ) where
  attr OnDragleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const value)) } 


instance Attr everything OnDragleave  Unit  where
  attr OnDragleave _ = unsafeAttribute (  
    { key: "dragleave", value: unset'  } <$ _)
instance Attr everything OnDragleave (Event.Event  Unit ) where
  attr OnDragleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "dragleave", value: unset' }
