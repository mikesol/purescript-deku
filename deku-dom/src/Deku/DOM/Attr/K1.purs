module Deku.DOM.Attr.K1 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComposite (FeComposite_)

data K1 = K1

instance Deku.Attribute.Attr everything K1 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "k1", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComposite_ K1 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "k1", value: _ } <<< Deku.Attribute.prop'
