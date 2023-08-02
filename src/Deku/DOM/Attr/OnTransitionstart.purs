module Deku.DOM.Attr.OnTransitionstart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionstart", value: cb' value })
instance Attr anything OnTransitionstart  Cb  where
  attr OnTransitionstart value = unsafeAttribute $ This
    { key: "transitionstart", value: cb' value }
instance Attr anything OnTransitionstart (Event.Event  Cb ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' value }

instance Attr anything OnTransitionstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionstart  (Effect Unit)  where
  attr OnTransitionstart value = unsafeAttribute $ This
    { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionstart (Event.Event  (Effect Unit) ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionstart  (Effect Boolean)  where
  attr OnTransitionstart value = unsafeAttribute $ This
    { key: "transitionstart", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionstart (Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' (Cb (const value)) }

type OnTransitionstartEffect =
  forall element
   . Attr element OnTransitionstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionstart", value: unset' })
instance Attr everything OnTransitionstart  Unit  where
  attr OnTransitionstart _ = unsafeAttribute $ This
    { key: "transitionstart", value: unset' }
instance Attr everything OnTransitionstart (Event.Event  Unit ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionstart", value: unset' }
