module Deku.DOM.Attr.OnAnimationcancel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationcancel = OnAnimationcancel

instance Attr anything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "animationcancel", value: cb' value })
instance Attr anything OnAnimationcancel  Cb  where
  attr OnAnimationcancel value = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: cb' value }
instance Attr anything OnAnimationcancel (Event.Event  Cb ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' value }

instance Attr anything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationcancel  (Effect Unit)  where
  attr OnAnimationcancel value = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationcancel (Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationcancel  (Effect Boolean)  where
  attr OnAnimationcancel value = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationcancel (Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' (Cb (const value)) }

type OnAnimationcancelEffect =
  forall element
   . Attr element OnAnimationcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationcancel", value: unset' })
instance Attr everything OnAnimationcancel  Unit  where
  attr OnAnimationcancel _ = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: unset' }
instance Attr everything OnAnimationcancel (Event.Event  Unit ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "animationcancel", value: unset' }
