module Deku.DOM.Attr.OnAnimationend where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnAnimationend = OnAnimationend
instance Attr anything OnAnimationend  Cb  where
  attr OnAnimationend value = unsafeAttribute (  
    { key: "animationend", value: cb' value  } <$ _)
instance Attr anything OnAnimationend (Event.Event Unit -> Event.Event  Cb ) where
  attr OnAnimationend eventValue = unsafeAttribute (map (map (
    \value -> { key: "animationend", value: cb' value })) eventValue)
instance Attr anything OnAnimationend (Event.Event  Cb ) where
  attr OnAnimationend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "animationend", value: cb' value }
instance Attr anything OnAnimationend  (Effect Unit)  where
  attr OnAnimationend value = unsafeAttribute (  
    { key: "animationend", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnAnimationend (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnAnimationend eventValue = unsafeAttribute (map (map (
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnAnimationend (Event.Event  (Effect Unit) ) where
  attr OnAnimationend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationend  (Effect Boolean)  where
  attr OnAnimationend value = unsafeAttribute (  
    { key: "animationend", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnAnimationend (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnAnimationend eventValue = unsafeAttribute (map (map (
    \value -> { key: "animationend", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnAnimationend (Event.Event  (Effect Boolean) ) where
  attr OnAnimationend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const value)) } 
instance Attr everything OnAnimationend  Unit  where
  attr OnAnimationend _ = unsafeAttribute (  
    { key: "animationend", value: unset'  } <$ _)
instance Attr everything OnAnimationend (Event.Event Unit -> Event.Event  Unit ) where
  attr OnAnimationend eventValue = unsafeAttribute (map (map (
    \_ -> { key: "animationend", value: unset' })) eventValue)
instance Attr everything OnAnimationend (Event.Event  Unit ) where
  attr OnAnimationend eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "animationend", value: unset' }