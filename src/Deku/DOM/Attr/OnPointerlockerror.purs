module Deku.DOM.Attr.OnPointerlockerror where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerlockerror = OnPointerlockerror

instance Attr anything OnPointerlockerror  Cb  where
  attr OnPointerlockerror value = unsafeAttribute (  
    { key: "pointerlockerror", value: cb' value  } <$ _)
instance Attr anything OnPointerlockerror (Event.Event  Cb ) where
  attr OnPointerlockerror eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "pointerlockerror", value: cb' value }


instance Attr anything OnPointerlockerror  (Effect Unit)  where
  attr OnPointerlockerror value = unsafeAttribute (  
    { key: "pointerlockerror", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerlockerror (Event.Event  (Effect Unit) ) where
  attr OnPointerlockerror eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "pointerlockerror", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerlockerror  (Effect Boolean)  where
  attr OnPointerlockerror value = unsafeAttribute (  
    { key: "pointerlockerror", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerlockerror (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockerror eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "pointerlockerror", value: cb' (Cb (const value)) } 


instance Attr everything OnPointerlockerror  Unit  where
  attr OnPointerlockerror _ = unsafeAttribute (  
    { key: "pointerlockerror", value: unset'  } <$ _)
instance Attr everything OnPointerlockerror (Event.Event  Unit ) where
  attr OnPointerlockerror eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "pointerlockerror", value: unset' }
