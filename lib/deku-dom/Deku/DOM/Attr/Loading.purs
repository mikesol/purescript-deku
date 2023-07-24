module Deku.DOM.Attr.Loading where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)

data Loading = Loading

instance Deku.Attribute.Attr everything Loading Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "loading", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Loading String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loading", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Loading String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loading", value: _ } <<< Deku.Attribute.prop'
