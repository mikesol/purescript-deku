module Deku.DOM.Attr.FillColor where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillColor = FillColor

instance Deku.Attribute.Attr everything FillColor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-color", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillColor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-color", value: _ } <<<
    Deku.Attribute.prop'
