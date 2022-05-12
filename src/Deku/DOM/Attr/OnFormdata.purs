module Deku.DOM.Attr.OnFormdata where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnFormdata = OnFormdata
instance Attr anything OnFormdata Cb where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' value }
instance Attr anything OnFormdata (Effect Unit) where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFormdata (Effect Boolean) where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' (Cb (const value)) }