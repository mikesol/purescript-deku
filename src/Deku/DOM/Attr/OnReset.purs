module Deku.DOM.Attr.OnReset where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnReset = OnReset

instance Attr anything OnReset  Cb  where
  attr OnReset value = unsafeAttribute (  
    { key: "reset", value: cb' value  } <$ _)
instance Attr anything OnReset (Event.Event  Cb ) where
  attr OnReset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "reset", value: cb' value }


instance Attr anything OnReset  (Effect Unit)  where
  attr OnReset value = unsafeAttribute (  
    { key: "reset", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnReset (Event.Event  (Effect Unit) ) where
  attr OnReset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnReset  (Effect Boolean)  where
  attr OnReset value = unsafeAttribute (  
    { key: "reset", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnReset (Event.Event  (Effect Boolean) ) where
  attr OnReset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const value)) } 


instance Attr everything OnReset  Unit  where
  attr OnReset _ = unsafeAttribute (  { key: "reset", value: unset'  } <$ _)
instance Attr everything OnReset (Event.Event  Unit ) where
  attr OnReset eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "reset", value: unset' }
