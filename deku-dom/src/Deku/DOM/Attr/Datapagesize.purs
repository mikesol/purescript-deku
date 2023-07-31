module Deku.DOM.Attr.Datapagesize where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Datapagesize = Datapagesize

instance Deku.Attribute.Attr everything Datapagesize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "datapagesize", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Datapagesize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "datapagesize", value: _ } <<<
    Deku.Attribute.prop'
