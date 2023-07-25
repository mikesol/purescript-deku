module Deku.DOM.Attr.Typemustmatch where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Object (Object_)

data Typemustmatch = Typemustmatch

instance Deku.Attribute.Attr everything Typemustmatch Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "typemustmatch", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Typemustmatch String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "typemustmatch", value: _ } <<<
    Deku.Attribute.prop'
