module Deku.DOM.Attr.FillPosition where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillPosition = FillPosition

instance Deku.Attribute.Attr everything FillPosition Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-position", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillPosition String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-position", value: _ } <<<
    Deku.Attribute.prop'
