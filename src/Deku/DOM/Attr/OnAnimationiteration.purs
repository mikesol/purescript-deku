module Deku.DOM.Attr.OnAnimationiteration where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both
    { key: "animationiteration", value: cb' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationiteration", value: cb' value }
    )
instance Attr anything OnAnimationiteration  Cb  where
  attr OnAnimationiteration value = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: cb' value }
instance Attr anything OnAnimationiteration (Event.Event  Cb ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "animationiteration", value: cb' value }

instance Attr anything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both
    { key: "animationiteration"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationiteration", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationiteration  (Effect Unit)  where
  attr OnAnimationiteration value = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationiteration (Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both
    { key: "animationiteration", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationiteration", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationiteration  (Effect Boolean)  where
  attr OnAnimationiteration value = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationiteration (Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const value)) }

type OnAnimationiterationEffect =
  forall element
   . Attr element OnAnimationiteration (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both
    { key: "animationiteration", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationiteration", value: unset' })
instance Attr everything OnAnimationiteration  Unit  where
  attr OnAnimationiteration _ = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: unset' }
instance Attr everything OnAnimationiteration (Event.Event  Unit ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "animationiteration", value: unset' }
