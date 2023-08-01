module Deku.DOM.Attr.OnAnimationcancel where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationcancel = OnAnimationcancel

instance Attr anything OnAnimationcancel Cb where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "animationcancel", value: cb' value })
  pureAttr OnAnimationcancel value = unsafeAttribute $ This
    { key: "animationcancel", value: cb' value }
  unpureAttr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' value }

instance Attr anything OnAnimationcancel (Effect Unit) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnAnimationcancel value = unsafeAttribute $ This
    { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationcancel (Effect Boolean) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const value)) }
    )
  pureAttr OnAnimationcancel value = unsafeAttribute $ This
    { key: "animationcancel", value: cb' (Cb (const value)) }
  unpureAttr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' (Cb (const value)) }

type OnAnimationcancelEffect =
  forall element
   . Attr element OnAnimationcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationcancel Unit where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both
    { key: "animationcancel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationcancel", value: unset' })
  pureAttr OnAnimationcancel _ = unsafeAttribute $ This
    { key: "animationcancel", value: unset' }
  unpureAttr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "animationcancel", value: unset' }
