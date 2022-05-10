module Deku.DOM.Attr.OnTimeupdate where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' value }

instance Attr anything OnTimeupdate (Effect Unit) where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTimeupdate (Effect Boolean) where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' (Cb (const value)) }