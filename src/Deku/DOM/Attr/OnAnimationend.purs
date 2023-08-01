module Deku.DOM.Attr.OnAnimationend where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationend = OnAnimationend

instance Attr anything OnAnimationend Cb where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "animationend", value: cb' value })
  pureAttr OnAnimationend value = unsafeAttribute $ This
    { key: "animationend", value: cb' value }
  unpureAttr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' value }

instance Attr anything OnAnimationend (Effect Unit) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnAnimationend value = unsafeAttribute $ This
    { key: "animationend", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationend (Effect Boolean) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const value)) }
    )
  pureAttr OnAnimationend value = unsafeAttribute $ This
    { key: "animationend", value: cb' (Cb (const value)) }
  unpureAttr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const value)) }

type OnAnimationendEffect =
  forall element
   . Attr element OnAnimationend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationend Unit where
  attr OnAnimationend bothValues = unsafeAttribute $ Both
    { key: "animationend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationend", value: unset' })
  pureAttr OnAnimationend _ = unsafeAttribute $ This
    { key: "animationend", value: unset' }
  unpureAttr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "animationend", value: unset' }
