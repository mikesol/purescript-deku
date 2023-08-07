module Deku.DOM.Attr.OnPointerenter where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter  Cb  where
  attr OnPointerenter value = unsafeAttribute (  
    { key: "pointerenter", value: cb' value  } <$ _)
instance Attr anything OnPointerenter (Event.Event  Cb ) where
  attr OnPointerenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerenter", value: cb' value }


instance Attr anything OnPointerenter  (Effect Unit)  where
  attr OnPointerenter value = unsafeAttribute (  
    { key: "pointerenter", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerenter (Event.Event  (Effect Unit) ) where
  attr OnPointerenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerenter  (Effect Boolean)  where
  attr OnPointerenter value = unsafeAttribute (  
    { key: "pointerenter", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerenter (Event.Event  (Effect Boolean) ) where
  attr OnPointerenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const value)) } 


instance Attr everything OnPointerenter  Unit  where
  attr OnPointerenter _ = unsafeAttribute (  
    { key: "pointerenter", value: unset'  } <$ _)
instance Attr everything OnPointerenter (Event.Event  Unit ) where
  attr OnPointerenter eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointerenter", value: unset' }
