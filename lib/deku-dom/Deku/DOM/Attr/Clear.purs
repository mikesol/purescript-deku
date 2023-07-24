module Deku.DOM.Attr.Clear where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Br (Br_)

data Clear = Clear

instance Deku.Attribute.Attr everything Clear Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "clear", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Br_ Clear String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clear", value: _ } <<< Deku.Attribute.prop'
