module Deku.DOM.Attr.OnCanplaythrough where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough  Cb  where
  attr OnCanplaythrough value = unsafeAttribute (  
    { key: "canplaythrough", value: cb' value  } <$ _)
instance Attr anything OnCanplaythrough (Event.Event  Cb ) where
  attr OnCanplaythrough eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "canplaythrough", value: cb' value }


instance Attr anything OnCanplaythrough  (Effect Unit)  where
  attr OnCanplaythrough value = unsafeAttribute (  
    { key: "canplaythrough", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnCanplaythrough (Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnCanplaythrough  (Effect Boolean)  where
  attr OnCanplaythrough value = unsafeAttribute (  
    { key: "canplaythrough", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnCanplaythrough (Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "canplaythrough", value: cb' (Cb (const value)) } 


instance Attr everything OnCanplaythrough  Unit  where
  attr OnCanplaythrough _ = unsafeAttribute (  
    { key: "canplaythrough", value: unset'  } <$ _)
instance Attr everything OnCanplaythrough (Event.Event  Unit ) where
  attr OnCanplaythrough eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "canplaythrough", value: unset' }
