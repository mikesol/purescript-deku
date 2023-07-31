module Deku.DOM.Attr.FillOrigin where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillOrigin = FillOrigin

instance Deku.Attribute.Attr everything FillOrigin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-origin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillOrigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-origin", value: _ } <<<
    Deku.Attribute.prop'
