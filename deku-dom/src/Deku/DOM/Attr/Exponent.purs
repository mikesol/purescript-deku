module Deku.DOM.Attr.Exponent where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)

data Exponent = Exponent

instance Deku.Attribute.Attr everything Exponent Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "exponent", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComponentTransfer_ Exponent String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "exponent", value: _ } <<< Deku.Attribute.prop'
