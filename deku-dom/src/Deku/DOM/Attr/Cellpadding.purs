module Deku.DOM.Attr.Cellpadding where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Cellpadding = Cellpadding

instance Deku.Attribute.Attr everything Cellpadding Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cellpadding", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Cellpadding String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cellpadding", value: _ } <<<
    Deku.Attribute.prop'
