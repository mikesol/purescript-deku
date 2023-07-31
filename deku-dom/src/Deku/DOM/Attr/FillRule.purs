module Deku.DOM.Attr.FillRule where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillRule = FillRule

instance Deku.Attribute.Attr everything FillRule Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-rule", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillRule String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-rule", value: _ } <<<
    Deku.Attribute.prop'
