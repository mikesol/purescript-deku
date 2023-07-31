module Deku.DOM.Attr.StopOpacity where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Stop (Stop_)

data StopOpacity = StopOpacity

instance Deku.Attribute.Attr everything StopOpacity Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stop-opacity", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Stop_ StopOpacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stop-opacity", value: _ } <<<
    Deku.Attribute.prop'
