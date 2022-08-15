module Deku.DOM.Attr.OnDurationchange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnDurationchange = OnDurationchange

instance Attr anything OnDurationchange Cb where
  attr OnDurationchange value = unsafeAttribute
    { key: "durationchange", value: cb' value }

instance Attr anything OnDurationchange (Effect Unit) where
  attr OnDurationchange value = unsafeAttribute
    { key: "durationchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDurationchange (Effect Boolean) where
  attr OnDurationchange value = unsafeAttribute
    { key: "durationchange", value: cb' (Cb (const value)) }

instance Attr anything OnDurationchange (Zora Unit) where
  attr OnDurationchange value = unsafeAttribute
    { key: "durationchange"
    , value: cb' (Cb (const (runImpure (value $> true))))
    }

instance Attr anything OnDurationchange (Zora Boolean) where
  attr OnDurationchange value = unsafeAttribute
    { key: "durationchange", value: cb' (Cb (const (runImpure value))) }