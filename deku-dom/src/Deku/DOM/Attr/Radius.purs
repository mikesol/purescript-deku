module Deku.DOM.Attr.Radius where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)

data Radius = Radius

instance Deku.Attribute.Attr everything Radius Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "radius", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeMorphology_ Radius String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "radius", value: _ } <<< Deku.Attribute.prop'
