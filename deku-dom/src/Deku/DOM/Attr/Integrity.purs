module Deku.DOM.Attr.Integrity where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)

data Integrity = Integrity

instance Deku.Attribute.Attr everything Integrity Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "integrity", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Integrity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "integrity", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Integrity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "integrity", value: _ } <<<
    Deku.Attribute.prop'
