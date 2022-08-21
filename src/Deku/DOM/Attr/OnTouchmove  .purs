module Deku.DOM.Attr.OnTouchmove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove Cb where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' value }

instance Attr anything OnTouchmove (Effect Unit) where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (Effect Boolean) where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' (Cb (const value)) }

instance Attr anything OnTouchmove (Zora Unit) where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnTouchmove (Zora Boolean) where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' (Cb (const (runImpure value))) }