module Deku.DOM.Attr.HttpEquiv where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Meta (Meta_)

data HttpEquiv = HttpEquiv

instance Deku.Attribute.Attr everything HttpEquiv Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "http-equiv", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Meta_ HttpEquiv String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "http-equiv", value: _ } <<<
    Deku.Attribute.prop'
