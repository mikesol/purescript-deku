module Deku.DOM.Attr.OnMousewheel where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel  Cb  where
  attr OnMousewheel value = unsafeAttribute (  
    { key: "mousewheel", value: cb' value  } <$ _)
instance Attr anything OnMousewheel (Event.Event  Cb ) where
  attr OnMousewheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousewheel", value: cb' value }


instance Attr anything OnMousewheel  (Effect Unit)  where
  attr OnMousewheel value = unsafeAttribute (  
    { key: "mousewheel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnMousewheel (Event.Event  (Effect Unit) ) where
  attr OnMousewheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMousewheel  (Effect Boolean)  where
  attr OnMousewheel value = unsafeAttribute (  
    { key: "mousewheel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnMousewheel (Event.Event  (Effect Boolean) ) where
  attr OnMousewheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const value)) } 


instance Attr everything OnMousewheel  Unit  where
  attr OnMousewheel _ = unsafeAttribute (  
    { key: "mousewheel", value: unset'  } <$ _)
instance Attr everything OnMousewheel (Event.Event  Unit ) where
  attr OnMousewheel eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "mousewheel", value: unset' }
