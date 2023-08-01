module Deku.DOM.Attr.OnTransitionrun where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionrun = OnTransitionrun

instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionrun", value: cb' value })
  pureAttr OnTransitionrun value = unsafeAttribute $ This
    { key: "transitionrun", value: cb' value }
  unpureAttr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' value }

instance Attr anything OnTransitionrun (Effect Unit) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTransitionrun value = unsafeAttribute $ This
    { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionrun (Effect Boolean) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const value)) }
    )
  pureAttr OnTransitionrun value = unsafeAttribute $ This
    { key: "transitionrun", value: cb' (Cb (const value)) }
  unpureAttr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' (Cb (const value)) }

type OnTransitionrunEffect =
  forall element
   . Attr element OnTransitionrun (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionrun Unit where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both
    { key: "transitionrun", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionrun", value: unset' })
  pureAttr OnTransitionrun _ = unsafeAttribute $ This
    { key: "transitionrun", value: unset' }
  unpureAttr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionrun", value: unset' }
