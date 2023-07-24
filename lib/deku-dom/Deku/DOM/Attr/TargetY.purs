module Deku.DOM.Attr.TargetY where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data TargetY = TargetY

instance Deku.Attribute.Attr everything TargetY Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "targetY", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ TargetY String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "targetY", value: _ } <<< Deku.Attribute.prop'
