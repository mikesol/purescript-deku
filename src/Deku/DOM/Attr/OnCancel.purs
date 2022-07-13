module Deku.DOM.Attr.OnCancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnCancel = OnCancel
instance Attr anything OnCancel Cb where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb' value }
instance Attr anything OnCancel (Effect Unit) where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCancel (Effect Boolean) where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb' (Cb (const value)) }