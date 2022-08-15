module Deku.DOM.Attr.OnBlur where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnBlur = OnBlur
instance Attr anything OnBlur Cb where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' value }
instance Attr anything OnBlur (Effect Unit) where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnBlur (Effect Boolean) where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' (Cb (const value)) }
instance Attr anything OnBlur (Zora Unit) where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnBlur (Zora Boolean) where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' (Cb (const (runImpure value))) }