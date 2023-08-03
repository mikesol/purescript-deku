module Deku.DOM.Attr.OnRatechange where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnRatechange = OnRatechange

instance Attr anything OnRatechange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "ratechange", value: cb' value })
instance Attr anything OnRatechange  Cb  where
  attr OnRatechange value = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: cb' value }
instance Attr anything OnRatechange (Event.Event  Cb ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' value }

instance Attr anything OnRatechange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnRatechange  (Effect Unit)  where
  attr OnRatechange value = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnRatechange (Event.Event  (Effect Unit) ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnRatechange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnRatechange  (Effect Boolean)  where
  attr OnRatechange value = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: cb' (Cb (const value)) }
instance Attr anything OnRatechange (Event.Event  (Effect Boolean) ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const value)) }

type OnRatechangeEffect =
  forall element
   . Attr element OnRatechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnRatechange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both
    { key: "ratechange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "ratechange", value: unset' })
instance Attr everything OnRatechange  Unit  where
  attr OnRatechange _ = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: unset' }
instance Attr everything OnRatechange (Event.Event  Unit ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "ratechange", value: unset' }
