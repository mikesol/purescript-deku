module Deku.DOM.Attr.NumOctaves where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)

data NumOctaves = NumOctaves

instance Deku.Attribute.Attr everything NumOctaves Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "numOctaves", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeTurbulence_ NumOctaves String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "numOctaves", value: _ } <<<
    Deku.Attribute.prop'
