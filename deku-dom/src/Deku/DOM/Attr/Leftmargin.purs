module Deku.DOM.Attr.Leftmargin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Body (Body_)

data Leftmargin = Leftmargin

instance Deku.Attribute.Attr everything Leftmargin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "leftmargin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Leftmargin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "leftmargin", value: _ } <<<
    Deku.Attribute.prop'
