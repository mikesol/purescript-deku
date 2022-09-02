module Deku.DOM.Attr.OnEnded where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)


data OnEnded = OnEnded
instance Attr anything OnEnded Cb where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' value }
instance Attr anything OnEnded (Effect Unit) where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEnded (Effect Boolean) where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' (Cb (const value)) }