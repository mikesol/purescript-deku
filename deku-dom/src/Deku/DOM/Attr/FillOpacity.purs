module Deku.DOM.Attr.FillOpacity where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillOpacity = FillOpacity

instance Deku.Attribute.Attr everything FillOpacity Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-opacity", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillOpacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-opacity", value: _ } <<<
    Deku.Attribute.prop'
