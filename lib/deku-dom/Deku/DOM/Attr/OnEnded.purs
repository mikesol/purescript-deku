module Deku.DOM.Attr.OnEnded where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnEnded = OnEnded

instance Attr anything OnEnded Cb where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' value }

instance Attr anything OnEnded (Effect Unit) where
  attr OnEnded value = unsafeAttribute
    { key: "ended", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEnded (Effect Boolean) where
  attr OnEnded value = unsafeAttribute
    { key: "ended", value: cb' (Cb (const value)) }

type OnEndedEffect =
  forall element
   . Attr element OnEnded (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEnded Unit where
  attr OnEnded _ = unsafeAttribute
    { key: "ended", value: unset' }
