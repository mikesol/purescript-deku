module Deku.DOM.Attr.Topmargin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Body (Body_)

data Topmargin = Topmargin

instance Deku.Attribute.Attr everything Topmargin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "topmargin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Topmargin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "topmargin", value: _ } <<<
    Deku.Attribute.prop'
