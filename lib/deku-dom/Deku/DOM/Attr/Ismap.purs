module Deku.DOM.Attr.Ismap where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)

data Ismap = Ismap

instance Deku.Attribute.Attr everything Ismap Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ismap", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Ismap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ismap", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Ismap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ismap", value: _ } <<< Deku.Attribute.prop'
