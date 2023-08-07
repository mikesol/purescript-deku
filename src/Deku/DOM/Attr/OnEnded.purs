module Deku.DOM.Attr.OnEnded where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnEnded = OnEnded

instance Attr anything OnEnded  Cb  where
  attr OnEnded value = unsafeAttribute (  
    { key: "ended", value: cb' value  } <$ _)
instance Attr anything OnEnded (Event.Event  Cb ) where
  attr OnEnded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ended", value: cb' value }


instance Attr anything OnEnded  (Effect Unit)  where
  attr OnEnded value = unsafeAttribute (  
    { key: "ended", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnEnded (Event.Event  (Effect Unit) ) where
  attr OnEnded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnEnded  (Effect Boolean)  where
  attr OnEnded value = unsafeAttribute (  
    { key: "ended", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnEnded (Event.Event  (Effect Boolean) ) where
  attr OnEnded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const value)) } 


instance Attr everything OnEnded  Unit  where
  attr OnEnded _ = unsafeAttribute (  { key: "ended", value: unset'  } <$ _)
instance Attr everything OnEnded (Event.Event  Unit ) where
  attr OnEnded eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "ended", value: unset' }
