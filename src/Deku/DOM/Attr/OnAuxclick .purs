module Deku.DOM.Attr.OnAuxclick where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick Cb where
  attr OnAuxclick value = unsafeAttribute { key: "auxclick ", value: cb' value }

instance Attr anything OnAuxclick (Effect Unit) where
  attr OnAuxclick value = unsafeAttribute
    { key: "auxclick ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (Effect Boolean) where
  attr OnAuxclick value = unsafeAttribute
    { key: "auxclick ", value: cb' (Cb (const value)) }