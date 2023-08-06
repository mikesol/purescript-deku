module Deku.DOM.Attr.OnAnimationiteration where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration  Cb  where
  attr OnAnimationiteration value = unsafeAttribute $ Left $  
    { key: "animationiteration", value: cb' value }
instance Attr anything OnAnimationiteration (Event.Event  Cb ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ Right $
    eventValue <#> \value -> { key: "animationiteration", value: cb' value }


instance Attr anything OnAnimationiteration  (Effect Unit)  where
  attr OnAnimationiteration value = unsafeAttribute $ Left $  
    { key: "animationiteration", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationiteration (Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAnimationiteration  (Effect Boolean)  where
  attr OnAnimationiteration value = unsafeAttribute $ Left $  
    { key: "animationiteration", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationiteration (Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const value)) }


instance Attr everything OnAnimationiteration  Unit  where
  attr OnAnimationiteration _ = unsafeAttribute $ Left $  
    { key: "animationiteration", value: unset' }
instance Attr everything OnAnimationiteration (Event.Event  Unit ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ Right $
    eventValue <#> \_ -> { key: "animationiteration", value: unset' }
