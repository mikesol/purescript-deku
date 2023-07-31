module Deku.DOM.Attr.PreserveAlpha where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data PreserveAlpha = PreserveAlpha

instance Deku.Attribute.Attr everything PreserveAlpha Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "preserveAlpha", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ PreserveAlpha String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "preserveAlpha", value: _ } <<<
    Deku.Attribute.prop'
