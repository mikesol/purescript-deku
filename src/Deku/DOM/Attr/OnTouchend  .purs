module Deku.DOM.Attr.OnTouchend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnTouchend = OnTouchend

instance Attr anything OnTouchend Cb where
  attr OnTouchend value = unsafeAttribute
    { key: "touchend  ", value: cb' value }

instance Attr anything OnTouchend (Effect Unit) where
  attr OnTouchend value = unsafeAttribute
    { key: "touchend  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchend (Effect Boolean) where
  attr OnTouchend value = unsafeAttribute
    { key: "touchend  ", value: cb' (Cb (const value)) }

instance Attr anything OnTouchend (Zora Unit) where
  attr OnTouchend value = unsafeAttribute
    { key: "touchend  ", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnTouchend (Zora Boolean) where
  attr OnTouchend value = unsafeAttribute
    { key: "touchend  ", value: cb' (Cb (const (runImpure value))) }