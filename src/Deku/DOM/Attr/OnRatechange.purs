module Deku.DOM.Attr.OnRatechange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnRatechange = OnRatechange

instance Attr anything OnRatechange Cb where
  attr OnRatechange value = unsafeAttribute
    { key: "ratechange", value: cb' value }

instance Attr anything OnRatechange (Effect Unit) where
  attr OnRatechange value = unsafeAttribute
    { key: "ratechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnRatechange (Effect Boolean) where
  attr OnRatechange value = unsafeAttribute
    { key: "ratechange", value: cb' (Cb (const value)) }

type OnRatechangeEffect = forall element. Attr element OnRatechange (Effect Unit) => Event (Attribute element)
