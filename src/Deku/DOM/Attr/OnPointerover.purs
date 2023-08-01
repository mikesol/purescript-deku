module Deku.DOM.Attr.OnPointerover where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerover = OnPointerover

instance Attr anything OnPointerover Cb where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerover", value: cb' value })
  pureAttr OnPointerover value = unsafeAttribute $ This
    { key: "pointerover", value: cb' value }
  unpureAttr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (Effect Unit) where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerover value = unsafeAttribute $ This
    { key: "pointerover", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (Effect Boolean) where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerover", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerover value = unsafeAttribute $ This
    { key: "pointerover", value: cb' (Cb (const value)) }
  unpureAttr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const value)) }

type OnPointeroverEffect =
  forall element
   . Attr element OnPointerover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerover Unit where
  attr OnPointerover bothValues = unsafeAttribute $ Both
    { key: "pointerover", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerover", value: unset' })
  pureAttr OnPointerover _ = unsafeAttribute $ This
    { key: "pointerover", value: unset' }
  unpureAttr OnPointerover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerover", value: unset' }
