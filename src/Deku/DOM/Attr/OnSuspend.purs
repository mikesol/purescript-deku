module Deku.DOM.Attr.OnSuspend where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSuspend = OnSuspend

instance Attr anything OnSuspend  Cb  where
  attr OnSuspend value = unsafeAttribute (  
    { key: "suspend", value: cb' value  } <$ _)
instance Attr anything OnSuspend (Event.Event  Cb ) where
  attr OnSuspend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "suspend", value: cb' value }


instance Attr anything OnSuspend  (Effect Unit)  where
  attr OnSuspend value = unsafeAttribute (  
    { key: "suspend", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSuspend (Event.Event  (Effect Unit) ) where
  attr OnSuspend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "suspend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSuspend  (Effect Boolean)  where
  attr OnSuspend value = unsafeAttribute (  
    { key: "suspend", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSuspend (Event.Event  (Effect Boolean) ) where
  attr OnSuspend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "suspend", value: cb' (Cb (const value)) } 


instance Attr everything OnSuspend  Unit  where
  attr OnSuspend _ = unsafeAttribute (  
    { key: "suspend", value: unset'  } <$ _)
instance Attr everything OnSuspend (Event.Event  Unit ) where
  attr OnSuspend eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "suspend", value: unset' }
