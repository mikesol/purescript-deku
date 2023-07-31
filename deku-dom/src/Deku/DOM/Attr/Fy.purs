module Deku.DOM.Attr.Fy where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)

data Fy = Fy

instance Deku.Attribute.Attr everything Fy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fy", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr RadialGradient_ Fy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fy", value: _ } <<< Deku.Attribute.prop'
