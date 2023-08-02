module Deku.DOM.Attr.OnTransitionrun where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionrun = OnTransitionrun

instance Attr anything OnTransitionrun (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionrun", value: cb' value })
instance Attr anything OnTransitionrun  Cb  where
  attr OnTransitionrun value = unsafeAttribute $ This
    { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionrun (Event.Event  Cb ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' value }

instance Attr anything OnTransitionrun (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionrun  (Effect Unit)  where
  attr OnTransitionrun value = unsafeAttribute $ This
    { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionrun (Event.Event  (Effect Unit) ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionrun (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionrun  (Effect Boolean)  where
  attr OnTransitionrun value = unsafeAttribute $ This
    { key: "transitionrun", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionrun (Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' (Cb (const value)) }

type OnTransitionrunEffect =
  forall element
   . Attr element OnTransitionrun (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionrun (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionrun", value: unset' })
instance Attr everything OnTransitionrun  Unit  where
  attr OnTransitionrun _ = unsafeAttribute $ This
    { key: "transitionrun", value: unset' }
instance Attr everything OnTransitionrun (Event.Event  Unit ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionrun", value: unset' }
