module Deku.DOM.Attr.Allowtransparency where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Iframe (Iframe_)

data Allowtransparency = Allowtransparency

instance Deku.Attribute.Attr everything Allowtransparency Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "allowtransparency", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Allowtransparency String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "allowtransparency", value: _ } <<<
    Deku.Attribute.prop'
