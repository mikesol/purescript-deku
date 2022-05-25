module Deku.DOM.Attr.OnRatechange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

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