module Deku.DOM.Attr.BaseFrequency where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)

data BaseFrequency = BaseFrequency

instance Deku.Attribute.Attr everything BaseFrequency Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "baseFrequency", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeTurbulence_ BaseFrequency String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "baseFrequency", value: _ } <<<
    Deku.Attribute.prop'
