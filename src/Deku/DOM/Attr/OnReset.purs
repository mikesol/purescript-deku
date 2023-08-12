module Deku.DOM.Attr.OnReset where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnReset = OnReset

instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' value }

instance Attr anything OnReset (Effect Unit) where
  attr OnReset value = unsafeAttribute
    { key: "reset", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnReset (Effect Boolean) where
  attr OnReset value = unsafeAttribute
    { key: "reset", value: cb' (Cb (const value)) }

type OnResetEffect =
  forall element
   . Attr element OnReset (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnReset Unit where
  attr OnReset _ = unsafeAttribute
    { key: "reset", value: unset' }
