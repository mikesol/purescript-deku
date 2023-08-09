module Deku.DOM.Attr.OnTransitioncancel where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnTransitioncancel = OnTransitioncancel
instance Attr anything OnTransitioncancel  Cb  where
  attr OnTransitioncancel value = unsafeAttribute (  
    { key: "transitioncancel", value: cb' value  } <$ _)
instance Attr anything OnTransitioncancel (Event.Event Unit -> Event.Event  Cb ) where
  attr OnTransitioncancel eventValue = unsafeAttribute (map (map ( \value -> { key: "transitioncancel", value: cb' value })) eventValue)
instance Attr anything OnTransitioncancel (Event.Event  Cb ) where
  attr OnTransitioncancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitioncancel  (Effect Unit)  where
  attr OnTransitioncancel value = unsafeAttribute (  
    { key: "transitioncancel", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTransitioncancel (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute (map (map ( \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnTransitioncancel (Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitioncancel  (Effect Boolean)  where
  attr OnTransitioncancel value = unsafeAttribute (  
    { key: "transitioncancel", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTransitioncancel (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute (map (map ( \value -> { key: "transitioncancel", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnTransitioncancel (Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitioncancel", value: cb' (Cb (const value)) } 
instance Attr everything OnTransitioncancel  Unit  where
  attr OnTransitioncancel _ = unsafeAttribute (  
    { key: "transitioncancel", value: unset'  } <$ _)
instance Attr everything OnTransitioncancel (Event.Event Unit -> Event.Event  Unit ) where
  attr OnTransitioncancel eventValue = unsafeAttribute (map (map ( \_ -> { key: "transitioncancel", value: unset' })) eventValue)
instance Attr everything OnTransitioncancel (Event.Event  Unit ) where
  attr OnTransitioncancel eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "transitioncancel", value: unset' }