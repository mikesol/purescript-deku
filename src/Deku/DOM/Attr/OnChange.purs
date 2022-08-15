module Deku.DOM.Attr.OnChange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnChange = OnChange

instance Attr anything OnChange Cb where
  attr OnChange value = unsafeAttribute { key: "change", value: cb' value }

instance Attr anything OnChange (Effect Unit) where
  attr OnChange value = unsafeAttribute
    { key: "change", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnChange (Effect Boolean) where
  attr OnChange value = unsafeAttribute
    { key: "change", value: cb' (Cb (const value)) }

instance Attr anything OnChange (Zora Unit) where
  attr OnChange value = unsafeAttribute
    { key: "change", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnChange (Zora Boolean) where
  attr OnChange value = unsafeAttribute
    { key: "change", value: cb' (Cb (const (runImpure value))) }