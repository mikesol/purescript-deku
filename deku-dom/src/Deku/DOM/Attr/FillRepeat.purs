module Deku.DOM.Attr.FillRepeat where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillRepeat = FillRepeat

instance Deku.Attribute.Attr everything FillRepeat Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-repeat", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillRepeat String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-repeat", value: _ } <<<
    Deku.Attribute.prop'
