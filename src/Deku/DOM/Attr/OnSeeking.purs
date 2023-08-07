module Deku.DOM.Attr.OnSeeking where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSeeking = OnSeeking

instance Attr anything OnSeeking  Cb  where
  attr OnSeeking value = unsafeAttribute (  
    { key: "seeking", value: cb' value  } <$ _)
instance Attr anything OnSeeking (Event.Event  Cb ) where
  attr OnSeeking eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "seeking", value: cb' value }


instance Attr anything OnSeeking  (Effect Unit)  where
  attr OnSeeking value = unsafeAttribute (  
    { key: "seeking", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSeeking (Event.Event  (Effect Unit) ) where
  attr OnSeeking eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "seeking", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSeeking  (Effect Boolean)  where
  attr OnSeeking value = unsafeAttribute (  
    { key: "seeking", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSeeking (Event.Event  (Effect Boolean) ) where
  attr OnSeeking eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "seeking", value: cb' (Cb (const value)) } 


instance Attr everything OnSeeking  Unit  where
  attr OnSeeking _ = unsafeAttribute (  
    { key: "seeking", value: unset'  } <$ _)
instance Attr everything OnSeeking (Event.Event  Unit ) where
  attr OnSeeking eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "seeking", value: unset' }
