module Deku.DOM.Attr.OnStalled where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnStalled = OnStalled

instance Attr anything OnStalled Cb where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stalled", value: cb' value })
  pureAttr OnStalled value = unsafeAttribute $ This
    { key: "stalled", value: cb' value }
  unpureAttr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stalled", value: cb' value }

instance Attr anything OnStalled (Effect Unit) where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stalled", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnStalled value = unsafeAttribute $ This
    { key: "stalled", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnStalled (Effect Boolean) where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stalled", value: cb' (Cb (const value)) }
    )
  pureAttr OnStalled value = unsafeAttribute $ This
    { key: "stalled", value: cb' (Cb (const value)) }
  unpureAttr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const value)) }

type OnStalledEffect =
  forall element
   . Attr element OnStalled (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnStalled Unit where
  attr OnStalled bothValues = unsafeAttribute $ Both
    { key: "stalled", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "stalled", value: unset' })
  pureAttr OnStalled _ = unsafeAttribute $ This
    { key: "stalled", value: unset' }
  unpureAttr OnStalled eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stalled", value: unset' }
