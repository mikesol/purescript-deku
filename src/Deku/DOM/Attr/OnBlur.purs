module Deku.DOM.Attr.OnBlur where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnBlur = OnBlur

instance Attr anything OnBlur  Cb  where
  attr OnBlur value = unsafeAttribute (  
    { key: "blur", value: cb' value  } <$ _)
instance Attr anything OnBlur (Event.Event  Cb ) where
  attr OnBlur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "blur", value: cb' value }


instance Attr anything OnBlur  (Effect Unit)  where
  attr OnBlur value = unsafeAttribute (  
    { key: "blur", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnBlur (Event.Event  (Effect Unit) ) where
  attr OnBlur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnBlur  (Effect Boolean)  where
  attr OnBlur value = unsafeAttribute (  
    { key: "blur", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnBlur (Event.Event  (Effect Boolean) ) where
  attr OnBlur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const value)) } 


instance Attr everything OnBlur  Unit  where
  attr OnBlur _ = unsafeAttribute (  { key: "blur", value: unset'  } <$ _)
instance Attr everything OnBlur (Event.Event  Unit ) where
  attr OnBlur eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "blur", value: unset' }
