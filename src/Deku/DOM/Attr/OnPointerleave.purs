module Deku.DOM.Attr.OnPointerleave where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerleave = OnPointerleave

instance Attr anything OnPointerleave Cb where
  attr OnPointerleave bothValues = unsafeAttribute $ Both
    { key: "pointerleave", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerleave", value: cb' value })
  pureAttr OnPointerleave value = unsafeAttribute $ This
    { key: "pointerleave", value: cb' value }
  unpureAttr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' value }

instance Attr anything OnPointerleave (Effect Unit) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both
    { key: "pointerleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerleave value = unsafeAttribute $ This
    { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerleave (Effect Boolean) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both
    { key: "pointerleave", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerleave value = unsafeAttribute $ This
    { key: "pointerleave", value: cb' (Cb (const value)) }
  unpureAttr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) }

type OnPointerleaveEffect =
  forall element
   . Attr element OnPointerleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerleave Unit where
  attr OnPointerleave bothValues = unsafeAttribute $ Both
    { key: "pointerleave", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerleave", value: unset' })
  pureAttr OnPointerleave _ = unsafeAttribute $ This
    { key: "pointerleave", value: unset' }
  unpureAttr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerleave", value: unset' }
