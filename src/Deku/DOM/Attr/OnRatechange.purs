module Deku.DOM.Attr.OnRatechange where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnRatechange = OnRatechange

instance Attr anything OnRatechange Cb where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "ratechange", value: cb' value })
  pureAttr OnRatechange value = unsafeAttribute $ This
    { key: "ratechange", value: cb' value }
  unpureAttr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' value }

instance Attr anything OnRatechange (Effect Unit) where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnRatechange value = unsafeAttribute $ This
    { key: "ratechange", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnRatechange (Effect Boolean) where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const value)) }
    )
  pureAttr OnRatechange value = unsafeAttribute $ This
    { key: "ratechange", value: cb' (Cb (const value)) }
  unpureAttr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const value)) }

type OnRatechangeEffect =
  forall element
   . Attr element OnRatechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnRatechange Unit where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "ratechange", value: unset' })
  pureAttr OnRatechange _ = unsafeAttribute $ This
    { key: "ratechange", value: unset' }
  unpureAttr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "ratechange", value: unset' }
