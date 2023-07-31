module Deku.DOM.Attr.TargetX where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data TargetX = TargetX

instance Deku.Attribute.Attr everything TargetX Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "targetX", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ TargetX String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "targetX", value: _ } <<< Deku.Attribute.prop'
