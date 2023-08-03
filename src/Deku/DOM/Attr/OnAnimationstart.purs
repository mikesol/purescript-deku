module Deku.DOM.Attr.OnAnimationstart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "animationstart", value: cb' value })
instance Attr anything OnAnimationstart  Cb  where
  attr OnAnimationstart value = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: cb' value }
instance Attr anything OnAnimationstart (Event.Event  Cb ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationstart", value: cb' value }

instance Attr anything OnAnimationstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationstart  (Effect Unit)  where
  attr OnAnimationstart value = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationstart (Event.Event  (Effect Unit) ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationstart  (Effect Boolean)  where
  attr OnAnimationstart value = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationstart (Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationstart", value: cb' (Cb (const value)) }

type OnAnimationstartEffect =
  forall element
   . Attr element OnAnimationstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both
    { key: "animationstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationstart", value: unset' })
instance Attr everything OnAnimationstart  Unit  where
  attr OnAnimationstart _ = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: unset' }
instance Attr everything OnAnimationstart (Event.Event  Unit ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "animationstart", value: unset' }
