module Deku.DOM.Attr.OnResize where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnResize = OnResize

instance Attr anything OnResize  Cb  where
  attr OnResize value = unsafeAttribute (  
    { key: "resize", value: cb' value  } <$ _)
instance Attr anything OnResize (Event.Event  Cb ) where
  attr OnResize eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "resize", value: cb' value }


instance Attr anything OnResize  (Effect Unit)  where
  attr OnResize value = unsafeAttribute (  
    { key: "resize", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnResize (Event.Event  (Effect Unit) ) where
  attr OnResize eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnResize  (Effect Boolean)  where
  attr OnResize value = unsafeAttribute (  
    { key: "resize", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnResize (Event.Event  (Effect Boolean) ) where
  attr OnResize eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const value)) } 


instance Attr everything OnResize  Unit  where
  attr OnResize _ = unsafeAttribute (  { key: "resize", value: unset'  } <$ _)
instance Attr everything OnResize (Event.Event  Unit ) where
  attr OnResize eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "resize", value: unset' }
