module Deku.DOM.Attr.Decoding where

import Prelude

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decoding = Decoding

instance Attr Img_ Decoding String where
  attr Decoding value = unsafeAttribute { key: "decoding", value: prop' value }

instance Attr everything Decoding Unit where
  attr Decoding _ = unsafeAttribute
    { key: "decoding", value: unset' }
