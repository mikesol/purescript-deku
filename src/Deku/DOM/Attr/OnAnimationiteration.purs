module Deku.DOM.Attr.OnAnimationiteration where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration  Cb  where
  attr OnAnimationiteration value = unsafeAttribute (  
    { key: "animationiteration", value: cb' value  } <$ _)
instance Attr anything OnAnimationiteration (Event.Event  Cb ) where
  attr OnAnimationiteration eventValue = unsafeAttribute \_ ->
    eventValue <#> \value -> { key: "animationiteration", value: cb' value }


instance Attr anything OnAnimationiteration  (Effect Unit)  where
  attr OnAnimationiteration value = unsafeAttribute (  
    { key: "animationiteration", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnAnimationiteration (Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAnimationiteration  (Effect Boolean)  where
  attr OnAnimationiteration value = unsafeAttribute (  
    { key: "animationiteration", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnAnimationiteration (Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const value)) } 


instance Attr everything OnAnimationiteration  Unit  where
  attr OnAnimationiteration _ = unsafeAttribute (  
    { key: "animationiteration", value: unset'  } <$ _)
instance Attr everything OnAnimationiteration (Event.Event  Unit ) where
  attr OnAnimationiteration eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "animationiteration", value: unset' }
