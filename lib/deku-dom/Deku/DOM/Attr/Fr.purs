module Deku.DOM.Attr.Fr where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.RadialGradient (RadialGradient_)

data Fr = Fr

instance Deku.Attribute.Attr everything Fr Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fr", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr RadialGradient_ Fr String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fr", value: _ } <<< Deku.Attribute.prop'
