module Deku.DOM.Attr.OnTouchend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

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

type OnTouchendEffect = forall element. Attr element OnTouchend (Effect Unit) => Event (Attribute element)
