module Deku.DOM.Attr.Language where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Script (Script_)

data Language = Language

instance Deku.Attribute.Attr everything Language Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "language", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Script_ Language String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "language", value: _ } <<< Deku.Attribute.prop'
