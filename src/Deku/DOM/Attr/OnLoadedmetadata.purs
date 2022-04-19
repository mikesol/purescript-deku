module Deku.DOM.Attr.OnLoadedmetadata where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnLoadedmetadata = OnLoadedmetadata
instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata value = unsafeAttribute { key: "loadedmetadata", value: cb' value }