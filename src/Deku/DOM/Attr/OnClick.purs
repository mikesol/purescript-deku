module Deku.DOM.Attr.OnClick where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnClick = OnClick

instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute { key: "click", value: cb' value }

instance Attr anything OnClick (Effect Unit) where
  attr OnClick value = unsafeAttribute
    { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (Effect Boolean) where
  attr OnClick value = unsafeAttribute
    { key: "click", value: cb' (Cb (const value)) }