module Deku.DOM.Attr.K2 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComposite (FeComposite_)

data K2 = K2

instance Deku.Attribute.Attr everything K2 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "k2", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComposite_ K2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "k2", value: _ } <<< Deku.Attribute.prop'
