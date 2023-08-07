module Deku.DOM.Attr.OnSubmit where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSubmit = OnSubmit

instance Attr anything OnSubmit  Cb  where
  attr OnSubmit value = unsafeAttribute (  
    { key: "submit", value: cb' value  } <$ _)
instance Attr anything OnSubmit (Event.Event  Cb ) where
  attr OnSubmit eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "submit", value: cb' value }


instance Attr anything OnSubmit  (Effect Unit)  where
  attr OnSubmit value = unsafeAttribute (  
    { key: "submit", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSubmit (Event.Event  (Effect Unit) ) where
  attr OnSubmit eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSubmit  (Effect Boolean)  where
  attr OnSubmit value = unsafeAttribute (  
    { key: "submit", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSubmit (Event.Event  (Effect Boolean) ) where
  attr OnSubmit eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const value)) } 


instance Attr everything OnSubmit  Unit  where
  attr OnSubmit _ = unsafeAttribute (  { key: "submit", value: unset'  } <$ _)
instance Attr everything OnSubmit (Event.Event  Unit ) where
  attr OnSubmit eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "submit", value: unset' }
