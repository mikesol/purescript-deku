module Deku.DOM.Attr.OnAnimationstart where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnAnimationstart = OnAnimationstart
instance Attr anything OnAnimationstart  Cb  where
  attr OnAnimationstart value = unsafeAttribute (  
    { key: "animationstart", value: cb' value  } <$ _)
instance Attr anything OnAnimationstart (Event.Event Unit -> Event.Event  Cb ) where
  attr OnAnimationstart eventValue = unsafeAttribute (map (map ( \value -> { key: "animationstart", value: cb' value })) eventValue)
instance Attr anything OnAnimationstart (Event.Event  Cb ) where
  attr OnAnimationstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "animationstart", value: cb' value }
instance Attr anything OnAnimationstart  (Effect Unit)  where
  attr OnAnimationstart value = unsafeAttribute (  
    { key: "animationstart", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnAnimationstart (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnAnimationstart eventValue = unsafeAttribute (map (map ( \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnAnimationstart (Event.Event  (Effect Unit) ) where
  attr OnAnimationstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationstart  (Effect Boolean)  where
  attr OnAnimationstart value = unsafeAttribute (  
    { key: "animationstart", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnAnimationstart (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart eventValue = unsafeAttribute (map (map ( \value -> { key: "animationstart", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnAnimationstart (Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "animationstart", value: cb' (Cb (const value)) } 
instance Attr everything OnAnimationstart  Unit  where
  attr OnAnimationstart _ = unsafeAttribute (  
    { key: "animationstart", value: unset'  } <$ _)
instance Attr everything OnAnimationstart (Event.Event Unit -> Event.Event  Unit ) where
  attr OnAnimationstart eventValue = unsafeAttribute (map (map ( \_ -> { key: "animationstart", value: unset' })) eventValue)
instance Attr everything OnAnimationstart (Event.Event  Unit ) where
  attr OnAnimationstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "animationstart", value: unset' }