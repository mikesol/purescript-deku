module Deku.DOM.Attr.OnPointerup where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerup = OnPointerup

instance Attr anything OnPointerup Cb where
  attr OnPointerup bothValues = unsafeAttribute $ Both
    { key: "pointerup", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerup", value: cb' value })
  pureAttr OnPointerup value = unsafeAttribute $ This
    { key: "pointerup", value: cb' value }
  unpureAttr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerup", value: cb' value }

instance Attr anything OnPointerup (Effect Unit) where
  attr OnPointerup bothValues = unsafeAttribute $ Both
    { key: "pointerup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerup", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerup value = unsafeAttribute $ This
    { key: "pointerup", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerup (Effect Boolean) where
  attr OnPointerup bothValues = unsafeAttribute $ Both
    { key: "pointerup", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerup", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerup value = unsafeAttribute $ This
    { key: "pointerup", value: cb' (Cb (const value)) }
  unpureAttr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const value)) }

type OnPointerupEffect =
  forall element
   . Attr element OnPointerup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerup Unit where
  attr OnPointerup bothValues = unsafeAttribute $ Both
    { key: "pointerup", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerup", value: unset' })
  pureAttr OnPointerup _ = unsafeAttribute $ This
    { key: "pointerup", value: unset' }
  unpureAttr OnPointerup eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerup", value: unset' }
