module Deku.DOM.Attr.OnSeeked where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnSeeked = OnSeeked

instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (Effect Unit) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (Effect Boolean) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const value)) }

instance Attr anything OnSeeked (Zora Unit) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnSeeked (Zora Boolean) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const (runImpure value))) }