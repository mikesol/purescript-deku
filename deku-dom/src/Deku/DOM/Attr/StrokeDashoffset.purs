module Deku.DOM.Attr.StrokeDashoffset where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeDashoffset = StrokeDashoffset

instance Deku.Attribute.Attr everything StrokeDashoffset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "stroke-dashoffset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeDashoffset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-dashoffset", value: _ } <<<
    Deku.Attribute.prop'
