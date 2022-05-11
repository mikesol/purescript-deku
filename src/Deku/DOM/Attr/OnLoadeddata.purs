module Deku.DOM.Attr.OnLoadeddata where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnLoadeddata = OnLoadeddata
instance Attr anything OnLoadeddata Cb where
  attr OnLoadeddata value = unsafeAttribute { key: "loadeddata", value: cb' value }
instance Attr anything OnLoadeddata (Effect Unit) where
  attr OnLoadeddata value = unsafeAttribute { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadeddata (Effect Boolean) where
  attr OnLoadeddata value = unsafeAttribute { key: "loadeddata", value: cb' (Cb (const value)) }