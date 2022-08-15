module Deku.DOM.Attr.OnLoad where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnLoad = OnLoad
instance Attr anything OnLoad Cb where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' value }
instance Attr anything OnLoad (Effect Unit) where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoad (Effect Boolean) where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' (Cb (const value)) }
instance Attr anything OnLoad (Zora Unit) where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnLoad (Zora Boolean) where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' (Cb (const (runImpure value))) }