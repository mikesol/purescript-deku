module Deku.DOM.Attr.Ismap where

import Prelude

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ismap = Ismap

instance Attr Img_ Ismap String where
  attr Ismap value = unsafeAttribute { key: "ismap", value: prop' value }

instance Attr everything Ismap Unit where
  attr Ismap _ = unsafeAttribute
    { key: "ismap", value: unset' }
