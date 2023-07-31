module Deku.DOM.Attr.Lowsrc where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Img (Img_)

data Lowsrc = Lowsrc

instance Deku.Attribute.Attr everything Lowsrc Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "lowsrc", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Lowsrc String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lowsrc", value: _ } <<< Deku.Attribute.prop'
