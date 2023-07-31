module Deku.DOM.Attr.Step where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Input (Input_)

data Step = Step

instance Deku.Attribute.Attr everything Step Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "step", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Step String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "step", value: _ } <<< Deku.Attribute.prop'
