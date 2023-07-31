module Deku.DOM.Attr.K4 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComposite (FeComposite_)

data K4 = K4

instance Deku.Attribute.Attr everything K4 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "k4", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComposite_ K4 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "k4", value: _ } <<< Deku.Attribute.prop'
