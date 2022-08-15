module Deku.DOM.Attr.OnSelect where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnSelect = OnSelect
instance Attr anything OnSelect Cb where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' value }
instance Attr anything OnSelect (Effect Unit) where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelect (Effect Boolean) where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' (Cb (const value)) }
instance Attr anything OnSelect (Zora Unit) where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnSelect (Zora Boolean) where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' (Cb (const (runImpure value))) }