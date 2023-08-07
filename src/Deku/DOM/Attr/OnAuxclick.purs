module Deku.DOM.Attr.OnAuxclick where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick  Cb  where
  attr OnAuxclick value = unsafeAttribute (  
    { key: "auxclick", value: cb' value  } <$ _)
instance Attr anything OnAuxclick (Event.Event  Cb ) where
  attr OnAuxclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "auxclick", value: cb' value }


instance Attr anything OnAuxclick  (Effect Unit)  where
  attr OnAuxclick value = unsafeAttribute (  
    { key: "auxclick", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnAuxclick (Event.Event  (Effect Unit) ) where
  attr OnAuxclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAuxclick  (Effect Boolean)  where
  attr OnAuxclick value = unsafeAttribute (  
    { key: "auxclick", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnAuxclick (Event.Event  (Effect Boolean) ) where
  attr OnAuxclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const value)) } 


instance Attr everything OnAuxclick  Unit  where
  attr OnAuxclick _ = unsafeAttribute (  
    { key: "auxclick", value: unset'  } <$ _)
instance Attr everything OnAuxclick (Event.Event  Unit ) where
  attr OnAuxclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "auxclick", value: unset' }
