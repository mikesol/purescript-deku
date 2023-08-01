module Deku.DOM.Attr.OnPointerout where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerout = OnPointerout

instance Attr anything OnPointerout Cb where
  attr OnPointerout bothValues = unsafeAttribute $ Both
    { key: "pointerout", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerout", value: cb' value })
  pureAttr OnPointerout value = unsafeAttribute $ This
    { key: "pointerout", value: cb' value }
  unpureAttr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (Effect Unit) where
  attr OnPointerout bothValues = unsafeAttribute $ Both
    { key: "pointerout", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerout value = unsafeAttribute $ This
    { key: "pointerout", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (Effect Boolean) where
  attr OnPointerout bothValues = unsafeAttribute $ Both
    { key: "pointerout", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerout", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerout value = unsafeAttribute $ This
    { key: "pointerout", value: cb' (Cb (const value)) }
  unpureAttr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const value)) }

type OnPointeroutEffect =
  forall element
   . Attr element OnPointerout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerout Unit where
  attr OnPointerout bothValues = unsafeAttribute $ Both
    { key: "pointerout", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerout", value: unset' })
  pureAttr OnPointerout _ = unsafeAttribute $ This
    { key: "pointerout", value: unset' }
  unpureAttr OnPointerout eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerout", value: unset' }
