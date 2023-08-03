module Deku.DOM.Attr.OnTransitioncancel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitioncancel = OnTransitioncancel

instance Attr anything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transitioncancel", value: cb' value })
instance Attr anything OnTransitioncancel  Cb  where
  attr OnTransitioncancel value = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitioncancel (Event.Event  Cb ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' value }

instance Attr anything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitioncancel  (Effect Unit)  where
  attr OnTransitioncancel value = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitioncancel (Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitioncancel  (Effect Boolean)  where
  attr OnTransitioncancel value = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: cb' (Cb (const value)) }
instance Attr anything OnTransitioncancel (Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' (Cb (const value)) }

type OnTransitioncancelEffect =
  forall element
   . Attr element OnTransitioncancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitioncancel", value: unset' })
instance Attr everything OnTransitioncancel  Unit  where
  attr OnTransitioncancel _ = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: unset' }
instance Attr everything OnTransitioncancel (Event.Event  Unit ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitioncancel", value: unset' }
