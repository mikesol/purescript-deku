module Deku.DOM.Attr.OnStalled where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnStalled = OnStalled

instance Attr anything OnStalled Cb where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' value }

instance Attr anything OnStalled (Effect Unit) where
  attr OnStalled value = unsafeAttribute
    { key: "stalled", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnStalled (Effect Boolean) where
  attr OnStalled value = unsafeAttribute
    { key: "stalled", value: cb' (Cb (const value)) }

type OnStalledEffect =
  forall element
   . Attr element OnStalled (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnStalled Unit where
  attr OnStalled _ = unsafeAttribute
    { key: "stalled", value: unset' }
