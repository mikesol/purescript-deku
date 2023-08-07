module Deku.DOM.Attr.OnClose where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnClose = OnClose

instance Attr anything OnClose  Cb  where
  attr OnClose value = unsafeAttribute (  
    { key: "close", value: cb' value  } <$ _)
instance Attr anything OnClose (Event.Event  Cb ) where
  attr OnClose eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "close", value: cb' value }


instance Attr anything OnClose  (Effect Unit)  where
  attr OnClose value = unsafeAttribute (  
    { key: "close", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnClose (Event.Event  (Effect Unit) ) where
  attr OnClose eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnClose  (Effect Boolean)  where
  attr OnClose value = unsafeAttribute (  
    { key: "close", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnClose (Event.Event  (Effect Boolean) ) where
  attr OnClose eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const value)) } 


instance Attr everything OnClose  Unit  where
  attr OnClose _ = unsafeAttribute (  { key: "close", value: unset'  } <$ _)
instance Attr everything OnClose (Event.Event  Unit ) where
  attr OnClose eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "close", value: unset' }
