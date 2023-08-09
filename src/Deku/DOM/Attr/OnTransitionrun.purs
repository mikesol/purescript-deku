module Deku.DOM.Attr.OnTransitionrun where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnTransitionrun = OnTransitionrun
instance Attr anything OnTransitionrun  Cb  where
  attr OnTransitionrun value = unsafeAttribute (  
    { key: "transitionrun", value: cb' value  } <$ _)
instance Attr anything OnTransitionrun (Event.Event Unit -> Event.Event  Cb ) where
  attr OnTransitionrun eventValue = unsafeAttribute (map (map ( \value -> { key: "transitionrun", value: cb' value })) eventValue)
instance Attr anything OnTransitionrun (Event.Event  Cb ) where
  attr OnTransitionrun eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionrun  (Effect Unit)  where
  attr OnTransitionrun value = unsafeAttribute (  
    { key: "transitionrun", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTransitionrun (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnTransitionrun eventValue = unsafeAttribute (map (map ( \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnTransitionrun (Event.Event  (Effect Unit) ) where
  attr OnTransitionrun eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionrun  (Effect Boolean)  where
  attr OnTransitionrun value = unsafeAttribute (  
    { key: "transitionrun", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTransitionrun (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun eventValue = unsafeAttribute (map (map ( \value -> { key: "transitionrun", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnTransitionrun (Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitionrun", value: cb' (Cb (const value)) } 
instance Attr everything OnTransitionrun  Unit  where
  attr OnTransitionrun _ = unsafeAttribute (  
    { key: "transitionrun", value: unset'  } <$ _)
instance Attr everything OnTransitionrun (Event.Event Unit -> Event.Event  Unit ) where
  attr OnTransitionrun eventValue = unsafeAttribute (map (map ( \_ -> { key: "transitionrun", value: unset' })) eventValue)
instance Attr everything OnTransitionrun (Event.Event  Unit ) where
  attr OnTransitionrun eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "transitionrun", value: unset' }