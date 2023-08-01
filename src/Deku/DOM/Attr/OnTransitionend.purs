module Deku.DOM.Attr.OnTransitionend where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend Cb where
  attr OnTransitionend bothValues = unsafeAttribute $ Both
    { key: "transitionend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionend", value: cb' value })
  pureAttr OnTransitionend value = unsafeAttribute $ This
    { key: "transitionend", value: cb' value }
  unpureAttr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionend", value: cb' value }

instance Attr anything OnTransitionend (Effect Unit) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both
    { key: "transitionend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnTransitionend value = unsafeAttribute $ This
    { key: "transitionend", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionend (Effect Boolean) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both
    { key: "transitionend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const value)) }
    )
  pureAttr OnTransitionend value = unsafeAttribute $ This
    { key: "transitionend", value: cb' (Cb (const value)) }
  unpureAttr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionend", value: cb' (Cb (const value)) }

type OnTransitionendEffect =
  forall element
   . Attr element OnTransitionend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionend Unit where
  attr OnTransitionend bothValues = unsafeAttribute $ Both
    { key: "transitionend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionend", value: unset' })
  pureAttr OnTransitionend _ = unsafeAttribute $ This
    { key: "transitionend", value: unset' }
  unpureAttr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionend", value: unset' }
