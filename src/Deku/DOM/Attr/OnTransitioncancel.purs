module Deku.DOM.Attr.OnTransitioncancel where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitioncancel = OnTransitioncancel

instance Attr anything OnTransitioncancel Cb where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "transitioncancel", value: cb' value })
  pureAttr OnTransitioncancel value = unsafeAttribute $ This
    { key: "transitioncancel", value: cb' value }
  unpureAttr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' value }

instance Attr anything OnTransitioncancel (Effect Unit) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel"
    , value: cb' (Cb (const ((fst bothValues) $> true)))
    }
    ( snd bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTransitioncancel value = unsafeAttribute $ This
    { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitioncancel (Effect Boolean) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const value)) }
    )
  pureAttr OnTransitioncancel value = unsafeAttribute $ This
    { key: "transitioncancel", value: cb' (Cb (const value)) }
  unpureAttr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' (Cb (const value)) }

type OnTransitioncancelEffect =
  forall element
   . Attr element OnTransitioncancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitioncancel Unit where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both
    { key: "transitioncancel", value: unset' }
    (snd bothValues <#> \_ -> { key: "transitioncancel", value: unset' })
  pureAttr OnTransitioncancel _ = unsafeAttribute $ This
    { key: "transitioncancel", value: unset' }
  unpureAttr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitioncancel", value: unset' }
