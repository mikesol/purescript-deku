module Deku.DOM.Attr.Fx where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)

data Fx = Fx

instance Deku.Attribute.Attr everything Fx Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fx", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr RadialGradient_ Fx String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fx", value: _ } <<< Deku.Attribute.prop'
