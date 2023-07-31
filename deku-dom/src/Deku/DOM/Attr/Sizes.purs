module Deku.DOM.Attr.Sizes where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Source (Source_)

data Sizes = Sizes

instance Deku.Attribute.Attr everything Sizes Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "sizes", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Img_ Sizes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "sizes", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Sizes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "sizes", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Sizes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "sizes", value: _ } <<< Deku.Attribute.prop'
