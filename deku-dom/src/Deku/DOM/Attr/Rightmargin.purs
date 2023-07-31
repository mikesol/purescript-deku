module Deku.DOM.Attr.Rightmargin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Body (Body_)

data Rightmargin = Rightmargin

instance Deku.Attribute.Attr everything Rightmargin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rightmargin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Rightmargin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rightmargin", value: _ } <<<
    Deku.Attribute.prop'
