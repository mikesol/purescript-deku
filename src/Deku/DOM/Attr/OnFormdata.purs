module Deku.DOM.Attr.OnFormdata where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnFormdata = OnFormdata
instance Attr anything OnFormdata Cb where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' value }
instance Attr anything OnFormdata (Effect Unit) where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFormdata (Effect Boolean) where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' (Cb (const value)) }
instance Attr anything OnFormdata (Zora Unit) where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnFormdata (Zora Boolean) where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' (Cb (const (runImpure value))) }