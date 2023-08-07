module Deku.DOM.Attr.OnCanplay where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnCanplay = OnCanplay

instance Attr anything OnCanplay  Cb  where
  attr OnCanplay value = unsafeAttribute (  
    { key: "canplay", value: cb' value  } <$ _)
instance Attr anything OnCanplay (Event.Event  Cb ) where
  attr OnCanplay eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "canplay", value: cb' value }


instance Attr anything OnCanplay  (Effect Unit)  where
  attr OnCanplay value = unsafeAttribute (  
    { key: "canplay", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnCanplay (Event.Event  (Effect Unit) ) where
  attr OnCanplay eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnCanplay  (Effect Boolean)  where
  attr OnCanplay value = unsafeAttribute (  
    { key: "canplay", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnCanplay (Event.Event  (Effect Boolean) ) where
  attr OnCanplay eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const value)) } 


instance Attr everything OnCanplay  Unit  where
  attr OnCanplay _ = unsafeAttribute (  
    { key: "canplay", value: unset'  } <$ _)
instance Attr everything OnCanplay (Event.Event  Unit ) where
  attr OnCanplay eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "canplay", value: unset' }
