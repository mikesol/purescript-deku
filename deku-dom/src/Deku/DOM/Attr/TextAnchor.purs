module Deku.DOM.Attr.TextAnchor where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data TextAnchor = TextAnchor

instance Deku.Attribute.Attr everything TextAnchor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "text-anchor", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything TextAnchor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "text-anchor", value: _ } <<<
    Deku.Attribute.prop'
