module Deku.DOM.Attr.OnDrag where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnDrag = OnDrag
instance Attr anything OnDrag Cb where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' value }
instance Attr anything OnDrag (Effect Unit) where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrag (Effect Boolean) where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' (Cb (const value)) }
instance Attr anything OnDrag (Zora Unit) where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnDrag (Zora Boolean) where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' (Cb (const (runImpure value))) }