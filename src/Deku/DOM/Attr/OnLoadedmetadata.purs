module Deku.DOM.Attr.OnLoadedmetadata where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnLoadedmetadata = OnLoadedmetadata
instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata value = unsafeAttribute { key: "loadedmetadata", value: cb' value }
instance Attr anything OnLoadedmetadata (Effect Unit) where
  attr OnLoadedmetadata value = unsafeAttribute { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadedmetadata (Effect Boolean) where
  attr OnLoadedmetadata value = unsafeAttribute { key: "loadedmetadata", value: cb' (Cb (const value)) }