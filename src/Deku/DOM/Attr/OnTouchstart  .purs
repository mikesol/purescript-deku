module Deku.DOM.Attr.OnTouchstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnTouchstart = OnTouchstart

instance Attr anything OnTouchstart Cb where
  attr OnTouchstart value = unsafeAttribute
    { key: "touchstart  ", value: cb' value }

instance Attr anything OnTouchstart (Effect Unit) where
  attr OnTouchstart value = unsafeAttribute
    { key: "touchstart  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchstart (Effect Boolean) where
  attr OnTouchstart value = unsafeAttribute
    { key: "touchstart  ", value: cb' (Cb (const value)) }

instance Attr anything OnTouchstart (Zora Unit) where
  attr OnTouchstart value = unsafeAttribute
    { key: "touchstart  ", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnTouchstart (Zora Boolean) where
  attr OnTouchstart value = unsafeAttribute
    { key: "touchstart  ", value: cb' (Cb (const (runImpure value))) }