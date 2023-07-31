module Deku.DOM.Attr.Enterkeyhint where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Enterkeyhint = Enterkeyhint

instance Deku.Attribute.Attr everything Enterkeyhint Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "enterkeyhint", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Enterkeyhint String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "enterkeyhint", value: _ } <<<
    Deku.Attribute.prop'
