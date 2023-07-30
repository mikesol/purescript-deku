module Deku.DOM.Attr.OnTransitionstart where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "transitionstart", value: cb' value })
  pureAttr OnTransitionstart value = unsafeAttribute $ This
    { key: "transitionstart", value: cb' value }
  unpureAttr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' value }

instance Attr anything OnTransitionstart (Effect Unit) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart"
    , value: cb' (Cb (const ((fst bothValues) $> true)))
    }
    ( snd bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTransitionstart value = unsafeAttribute $ This
    { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionstart (Effect Boolean) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const value)) }
    )
  pureAttr OnTransitionstart value = unsafeAttribute $ This
    { key: "transitionstart", value: cb' (Cb (const value)) }
  unpureAttr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' (Cb (const value)) }

type OnTransitionstartEffect =
  forall element
   . Attr element OnTransitionstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionstart Unit where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both
    { key: "transitionstart", value: unset' }
    (snd bothValues <#> \_ -> { key: "transitionstart", value: unset' })
  pureAttr OnTransitionstart _ = unsafeAttribute $ This
    { key: "transitionstart", value: unset' }
  unpureAttr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionstart", value: unset' }
