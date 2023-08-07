module Deku.DOM.Attr.OnKeypress where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnKeypress = OnKeypress

instance Attr anything OnKeypress  Cb  where
  attr OnKeypress value = unsafeAttribute (  
    { key: "keypress", value: cb' value  } <$ _)
instance Attr anything OnKeypress (Event.Event  Cb ) where
  attr OnKeypress eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keypress", value: cb' value }


instance Attr anything OnKeypress  (Effect Unit)  where
  attr OnKeypress value = unsafeAttribute (  
    { key: "keypress", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnKeypress (Event.Event  (Effect Unit) ) where
  attr OnKeypress eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnKeypress  (Effect Boolean)  where
  attr OnKeypress value = unsafeAttribute (  
    { key: "keypress", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnKeypress (Event.Event  (Effect Boolean) ) where
  attr OnKeypress eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const value)) } 


instance Attr everything OnKeypress  Unit  where
  attr OnKeypress _ = unsafeAttribute (  
    { key: "keypress", value: unset'  } <$ _)
instance Attr everything OnKeypress (Event.Event  Unit ) where
  attr OnKeypress eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "keypress", value: unset' }
