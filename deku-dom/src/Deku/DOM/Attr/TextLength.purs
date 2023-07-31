module Deku.DOM.Attr.TextLength where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)

data TextLength = TextLength

instance Deku.Attribute.Attr everything TextLength Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "textLength", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ TextLength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "textLength", value: _ } <<<
    Deku.Attribute.prop'
