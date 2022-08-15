module Deku.DOM.Attr.OnLoadstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnLoadstart = OnLoadstart
instance Attr anything OnLoadstart Cb where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' value }
instance Attr anything OnLoadstart (Effect Unit) where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadstart (Effect Boolean) where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' (Cb (const value)) }
instance Attr anything OnLoadstart (Zora Unit) where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnLoadstart (Zora Boolean) where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' (Cb (const (runImpure value))) }