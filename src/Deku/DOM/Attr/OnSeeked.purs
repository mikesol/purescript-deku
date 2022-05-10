module Deku.DOM.Attr.OnSeeked where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnSeeked = OnSeeked

instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (Effect Unit) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (Effect Boolean) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const value)) }