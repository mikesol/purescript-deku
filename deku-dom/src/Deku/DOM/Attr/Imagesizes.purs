module Deku.DOM.Attr.Imagesizes where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Link (Link_)

data Imagesizes = Imagesizes

instance Deku.Attribute.Attr everything Imagesizes Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "imagesizes", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Imagesizes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "imagesizes", value: _ } <<<
    Deku.Attribute.prop'
