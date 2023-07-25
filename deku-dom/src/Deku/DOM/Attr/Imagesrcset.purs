module Deku.DOM.Attr.Imagesrcset where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Link (Link_)

data Imagesrcset = Imagesrcset

instance Deku.Attribute.Attr everything Imagesrcset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "imagesrcset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Imagesrcset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "imagesrcset", value: _ } <<<
    Deku.Attribute.prop'
