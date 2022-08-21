module Deku.DOM.Attr.OnTimeupdate where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnTimeupdate (Zora Unit) where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnTimeupdate (Zora Boolean) where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' (Cb (const (runImpure value))) }