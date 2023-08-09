module Deku.DOM.Attr.OnAnimationcancel where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnAnimationcancel = OnAnimationcancel
instance Attr anything OnAnimationcancel  Cb  where
  attr OnAnimationcancel value = unsafeAttribute (  
    { key: "animationcancel", value: cb' value  } <$ _)
instance Attr anything OnAnimationcancel (Event.Event Unit -> Event.Event  Cb ) where
  attr OnAnimationcancel eventValue = unsafeAttribute (map (map ( \value -> { key: "animationcancel", value: cb' value })) eventValue)
instance Attr anything OnAnimationcancel (Event.Event  Cb ) where
  attr OnAnimationcancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "animationcancel", value: cb' value }
instance Attr anything OnAnimationcancel  (Effect Unit)  where
  attr OnAnimationcancel value = unsafeAttribute (  
    { key: "animationcancel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnAnimationcancel (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute (map (map ( \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnAnimationcancel (Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationcancel  (Effect Boolean)  where
  attr OnAnimationcancel value = unsafeAttribute (  
    { key: "animationcancel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnAnimationcancel (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute (map (map ( \value -> { key: "animationcancel", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnAnimationcancel (Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "animationcancel", value: cb' (Cb (const value)) } 
instance Attr everything OnAnimationcancel  Unit  where
  attr OnAnimationcancel _ = unsafeAttribute (  
    { key: "animationcancel", value: unset'  } <$ _)
instance Attr everything OnAnimationcancel (Event.Event Unit -> Event.Event  Unit ) where
  attr OnAnimationcancel eventValue = unsafeAttribute (map (map ( \_ -> { key: "animationcancel", value: unset' })) eventValue)
instance Attr everything OnAnimationcancel (Event.Event  Unit ) where
  attr OnAnimationcancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "animationcancel", value: unset' }