module Deku.DOM.Attr.OnMouseup where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseup = OnMouseup

instance Attr anything OnMouseup  Cb  where
  attr OnMouseup value = unsafeAttribute (  
    { key: "mouseup", value: cb' value  } <$ _)
instance Attr anything OnMouseup (Event.Event  Cb ) where
  attr OnMouseup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseup", value: cb' value }


instance Attr anything OnMouseup  (Effect Unit)  where
  attr OnMouseup value = unsafeAttribute (  
    { key: "mouseup", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMouseup (Event.Event  (Effect Unit) ) where
  attr OnMouseup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseup  (Effect Boolean)  where
  attr OnMouseup value = unsafeAttribute (  
    { key: "mouseup", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMouseup (Event.Event  (Effect Boolean) ) where
  attr OnMouseup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const value)) } 


instance Attr everything OnMouseup  Unit  where
  attr OnMouseup _ = unsafeAttribute (  
    { key: "mouseup", value: unset'  } <$ _)
instance Attr everything OnMouseup (Event.Event  Unit ) where
  attr OnMouseup eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mouseup", value: unset' }
