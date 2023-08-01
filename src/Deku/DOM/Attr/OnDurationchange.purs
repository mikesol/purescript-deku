module Deku.DOM.Attr.OnDurationchange where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDurationchange = OnDurationchange

instance Attr anything OnDurationchange Cb where
  attr OnDurationchange bothValues = unsafeAttribute $ Both
    { key: "durationchange", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "durationchange", value: cb' value })
  pureAttr OnDurationchange value = unsafeAttribute $ This
    { key: "durationchange", value: cb' value }
  unpureAttr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "durationchange", value: cb' value }

instance Attr anything OnDurationchange (Effect Unit) where
  attr OnDurationchange bothValues = unsafeAttribute $ Both
    { key: "durationchange"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "durationchange", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnDurationchange value = unsafeAttribute $ This
    { key: "durationchange", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "durationchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDurationchange (Effect Boolean) where
  attr OnDurationchange bothValues = unsafeAttribute $ Both
    { key: "durationchange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "durationchange", value: cb' (Cb (const value)) }
    )
  pureAttr OnDurationchange value = unsafeAttribute $ This
    { key: "durationchange", value: cb' (Cb (const value)) }
  unpureAttr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "durationchange", value: cb' (Cb (const value)) }

type OnDurationchangeEffect =
  forall element
   . Attr element OnDurationchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDurationchange Unit where
  attr OnDurationchange bothValues = unsafeAttribute $ Both
    { key: "durationchange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "durationchange", value: unset' })
  pureAttr OnDurationchange _ = unsafeAttribute $ This
    { key: "durationchange", value: unset' }
  unpureAttr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "durationchange", value: unset' }
