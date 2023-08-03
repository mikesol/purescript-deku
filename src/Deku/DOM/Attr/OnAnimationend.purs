module Deku.DOM.Attr.OnAnimationend where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationend = OnAnimationend

instance Attr anything OnAnimationend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "animationend", value: cb' value })
instance Attr anything OnAnimationend  Cb  where
  attr OnAnimationend value = unsafeAttribute $ This $ pure $
    { key: "animationend", value: cb' value }
instance Attr anything OnAnimationend (Event.Event  Cb ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' value }

instance Attr anything OnAnimationend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationend  (Effect Unit)  where
  attr OnAnimationend value = unsafeAttribute $ This $ pure $
    { key: "animationend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationend (Event.Event  (Effect Unit) ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationend  (Effect Boolean)  where
  attr OnAnimationend value = unsafeAttribute $ This $ pure $
    { key: "animationend", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationend (Event.Event  (Effect Boolean) ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const value)) }

type OnAnimationendEffect =
  forall element
   . Attr element OnAnimationend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationend", value: unset' })
instance Attr everything OnAnimationend  Unit  where
  attr OnAnimationend _ = unsafeAttribute $ This $ pure $
    { key: "animationend", value: unset' }
instance Attr everything OnAnimationend (Event.Event  Unit ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "animationend", value: unset' }
