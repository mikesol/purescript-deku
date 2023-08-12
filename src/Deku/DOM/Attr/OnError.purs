module Deku.DOM.Attr.OnError where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnError = OnError

instance Attr anything OnError Cb where
  attr OnError value = unsafeAttribute { key: "error", value: cb' value }

instance Attr anything OnError (Effect Unit) where
  attr OnError value = unsafeAttribute
    { key: "error", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnError (Effect Boolean) where
  attr OnError value = unsafeAttribute
    { key: "error", value: cb' (Cb (const value)) }

type OnErrorEffect =
  forall element
   . Attr element OnError (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnError Unit where
  attr OnError _ = unsafeAttribute
    { key: "error", value: unset' }
