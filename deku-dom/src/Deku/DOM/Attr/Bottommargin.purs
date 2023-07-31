module Deku.DOM.Attr.Bottommargin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Body (Body_)

data Bottommargin = Bottommargin

instance Deku.Attribute.Attr everything Bottommargin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "bottommargin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Bottommargin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bottommargin", value: _ } <<<
    Deku.Attribute.prop'
