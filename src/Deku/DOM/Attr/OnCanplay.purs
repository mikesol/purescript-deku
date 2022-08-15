module Deku.DOM.Attr.OnCanplay where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnCanplay = OnCanplay
instance Attr anything OnCanplay Cb where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' value }
instance Attr anything OnCanplay (Effect Unit) where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCanplay (Effect Boolean) where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' (Cb (const value)) }
instance Attr anything OnCanplay (Zora Unit) where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnCanplay (Zora Boolean) where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' (Cb (const (runImpure value))) }