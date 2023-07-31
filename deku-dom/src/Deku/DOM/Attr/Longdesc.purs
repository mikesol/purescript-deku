module Deku.DOM.Attr.Longdesc where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)

data Longdesc = Longdesc

instance Deku.Attribute.Attr everything Longdesc Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "longdesc", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Longdesc String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "longdesc", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Longdesc String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "longdesc", value: _ } <<< Deku.Attribute.prop'
