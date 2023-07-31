module Deku.DOM.Attr.Itemscope where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Itemscope = Itemscope

instance Deku.Attribute.Attr everything Itemscope Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "itemscope", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Itemscope String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "itemscope", value: _ } <<<
    Deku.Attribute.prop'
