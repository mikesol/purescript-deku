module Deku.DOM.Attr.OnDurationchange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

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

type OnDurationchangeEffect =
  forall element
   . Attr element OnDurationchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDurationchange Unit where
  attr OnDurationchange _ = unsafeAttribute
    { key: "durationchange", value: unset' }
