module Deku.DOM.Attr.Cellspacing where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Cellspacing = Cellspacing

instance Deku.Attribute.Attr everything Cellspacing Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cellspacing", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Cellspacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cellspacing", value: _ } <<<
    Deku.Attribute.prop'
