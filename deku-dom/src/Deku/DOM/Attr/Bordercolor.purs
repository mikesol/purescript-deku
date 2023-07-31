module Deku.DOM.Attr.Bordercolor where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Bordercolor = Bordercolor

instance Deku.Attribute.Attr everything Bordercolor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "bordercolor", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Bordercolor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bordercolor", value: _ } <<<
    Deku.Attribute.prop'
