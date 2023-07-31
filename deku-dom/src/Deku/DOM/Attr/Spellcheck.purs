module Deku.DOM.Attr.Spellcheck where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Spellcheck = Spellcheck

instance Deku.Attribute.Attr everything Spellcheck Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "spellcheck", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Spellcheck String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "spellcheck", value: _ } <<<
    Deku.Attribute.prop'
