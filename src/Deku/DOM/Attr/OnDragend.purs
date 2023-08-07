module Deku.DOM.Attr.OnDragend where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDragend = OnDragend

instance Attr anything OnDragend  Cb  where
  attr OnDragend value = unsafeAttribute (  
    { key: "dragend", value: cb' value  } <$ _)
instance Attr anything OnDragend (Event.Event  Cb ) where
  attr OnDragend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragend", value: cb' value }


instance Attr anything OnDragend  (Effect Unit)  where
  attr OnDragend value = unsafeAttribute (  
    { key: "dragend", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDragend (Event.Event  (Effect Unit) ) where
  attr OnDragend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragend  (Effect Boolean)  where
  attr OnDragend value = unsafeAttribute (  
    { key: "dragend", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDragend (Event.Event  (Effect Boolean) ) where
  attr OnDragend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const value)) } 


instance Attr everything OnDragend  Unit  where
  attr OnDragend _ = unsafeAttribute (  
    { key: "dragend", value: unset'  } <$ _)
instance Attr everything OnDragend (Event.Event  Unit ) where
  attr OnDragend eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "dragend", value: unset' }
