module Deku.DOM.Attr.StopColor where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Stop (Stop_)

data StopColor = StopColor

instance Deku.Attribute.Attr everything StopColor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stop-color", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Stop_ StopColor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stop-color", value: _ } <<<
    Deku.Attribute.prop'
