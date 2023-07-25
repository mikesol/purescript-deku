module Deku.DOM.Attr.Decoding where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Img (Img_)

data Decoding = Decoding

instance Deku.Attribute.Attr everything Decoding Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "decoding", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Decoding String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "decoding", value: _ } <<< Deku.Attribute.prop'
