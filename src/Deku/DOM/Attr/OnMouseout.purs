module Deku.DOM.Attr.OnMouseout where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseout = OnMouseout

instance Attr anything OnMouseout  Cb  where
  attr OnMouseout value = unsafeAttribute (  
    { key: "mouseout", value: cb' value  } <$ _)
instance Attr anything OnMouseout (Event.Event  Cb ) where
  attr OnMouseout eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseout", value: cb' value }


instance Attr anything OnMouseout  (Effect Unit)  where
  attr OnMouseout value = unsafeAttribute (  
    { key: "mouseout", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMouseout (Event.Event  (Effect Unit) ) where
  attr OnMouseout eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseout  (Effect Boolean)  where
  attr OnMouseout value = unsafeAttribute (  
    { key: "mouseout", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMouseout (Event.Event  (Effect Boolean) ) where
  attr OnMouseout eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const value)) } 


instance Attr everything OnMouseout  Unit  where
  attr OnMouseout _ = unsafeAttribute (  
    { key: "mouseout", value: unset'  } <$ _)
instance Attr everything OnMouseout (Event.Event  Unit ) where
  attr OnMouseout eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mouseout", value: unset' }
