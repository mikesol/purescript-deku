module Deku.DOM.Attr.Slope where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)

data Slope = Slope

instance Deku.Attribute.Attr everything Slope Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "slope", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComponentTransfer_ Slope String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "slope", value: _ } <<< Deku.Attribute.prop'
