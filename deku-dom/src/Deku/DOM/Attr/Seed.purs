module Deku.DOM.Attr.Seed where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)

data Seed = Seed

instance Deku.Attribute.Attr everything Seed Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "seed", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeTurbulence_ Seed String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "seed", value: _ } <<< Deku.Attribute.prop'
