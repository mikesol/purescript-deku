module Deku.DOM.Attr.OnShow where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnShow = OnShow

instance Attr anything OnShow  Cb  where
  attr OnShow value = unsafeAttribute (  
    { key: "show", value: cb' value  } <$ _)
instance Attr anything OnShow (Event.Event  Cb ) where
  attr OnShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "show", value: cb' value }


instance Attr anything OnShow  (Effect Unit)  where
  attr OnShow value = unsafeAttribute (  
    { key: "show", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnShow (Event.Event  (Effect Unit) ) where
  attr OnShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnShow  (Effect Boolean)  where
  attr OnShow value = unsafeAttribute (  
    { key: "show", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnShow (Event.Event  (Effect Boolean) ) where
  attr OnShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const value)) } 


instance Attr everything OnShow  Unit  where
  attr OnShow _ = unsafeAttribute (  { key: "show", value: unset'  } <$ _)
instance Attr everything OnShow (Event.Event  Unit ) where
  attr OnShow eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "show", value: unset' }
