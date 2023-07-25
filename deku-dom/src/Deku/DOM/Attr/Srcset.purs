module Deku.DOM.Attr.Srcset where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)

data Srcset = Srcset

instance Deku.Attribute.Attr everything Srcset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "srcset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Srcset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "srcset", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Srcset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "srcset", value: _ } <<< Deku.Attribute.prop'
