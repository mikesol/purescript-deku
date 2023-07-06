module Deku.DOM.Attr.OnWaiting where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnWaiting = OnWaiting

instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' value }

instance Attr anything OnWaiting (Effect Unit) where
  attr OnWaiting value = unsafeAttribute
    { key: "waiting", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWaiting (Effect Boolean) where
  attr OnWaiting value = unsafeAttribute
    { key: "waiting", value: cb' (Cb (const value)) }

type OnWaitingEffect =
  forall element
   . Attr element OnWaiting (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWaiting Unit where
  attr OnWaiting _ = unsafeAttribute
    { key: "waiting", value: unset' }
