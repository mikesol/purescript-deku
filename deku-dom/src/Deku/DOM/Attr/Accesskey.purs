module Deku.DOM.Attr.Accesskey where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Accesskey = Accesskey

instance Deku.Attribute.Attr everything Accesskey Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "accesskey", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Accesskey String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "accesskey", value: _ } <<<
    Deku.Attribute.prop'
