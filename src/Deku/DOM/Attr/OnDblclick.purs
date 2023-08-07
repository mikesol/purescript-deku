module Deku.DOM.Attr.OnDblclick where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDblclick = OnDblclick

instance Attr anything OnDblclick  Cb  where
  attr OnDblclick value = unsafeAttribute (  
    { key: "dblclick", value: cb' value  } <$ _)
instance Attr anything OnDblclick (Event.Event  Cb ) where
  attr OnDblclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dblclick", value: cb' value }


instance Attr anything OnDblclick  (Effect Unit)  where
  attr OnDblclick value = unsafeAttribute (  
    { key: "dblclick", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDblclick (Event.Event  (Effect Unit) ) where
  attr OnDblclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDblclick  (Effect Boolean)  where
  attr OnDblclick value = unsafeAttribute (  
    { key: "dblclick", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDblclick (Event.Event  (Effect Boolean) ) where
  attr OnDblclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const value)) } 


instance Attr everything OnDblclick  Unit  where
  attr OnDblclick _ = unsafeAttribute (  
    { key: "dblclick", value: unset'  } <$ _)
instance Attr everything OnDblclick (Event.Event  Unit ) where
  attr OnDblclick eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "dblclick", value: unset' }
