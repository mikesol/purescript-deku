module Deku.DOM.Attr.Frame where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Frame = Frame

instance Deku.Attribute.Attr everything Frame Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "frame", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Frame String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "frame", value: _ } <<< Deku.Attribute.prop'
