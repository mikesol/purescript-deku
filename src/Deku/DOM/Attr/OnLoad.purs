module Deku.DOM.Attr.OnLoad where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoad = OnLoad

instance Attr anything OnLoad  Cb  where
  attr OnLoad value = unsafeAttribute (  
    { key: "load", value: cb' value  } <$ _)
instance Attr anything OnLoad (Event.Event  Cb ) where
  attr OnLoad eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "load", value: cb' value }


instance Attr anything OnLoad  (Effect Unit)  where
  attr OnLoad value = unsafeAttribute (  
    { key: "load", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnLoad (Event.Event  (Effect Unit) ) where
  attr OnLoad eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoad  (Effect Boolean)  where
  attr OnLoad value = unsafeAttribute (  
    { key: "load", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnLoad (Event.Event  (Effect Boolean) ) where
  attr OnLoad eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const value)) } 


instance Attr everything OnLoad  Unit  where
  attr OnLoad _ = unsafeAttribute (  { key: "load", value: unset'  } <$ _)
instance Attr everything OnLoad (Event.Event  Unit ) where
  attr OnLoad eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "load", value: unset' }
