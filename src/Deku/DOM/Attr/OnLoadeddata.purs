module Deku.DOM.Attr.OnLoadeddata where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnLoadeddata = OnLoadeddata
instance Attr anything OnLoadeddata Cb where
  attr OnLoadeddata value = unsafeAttribute { key: "loadeddata", value: cb' value }