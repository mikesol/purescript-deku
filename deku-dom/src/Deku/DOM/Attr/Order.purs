module Deku.DOM.Attr.Order where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data Order = Order

instance Deku.Attribute.Attr everything Order Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "order", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ Order String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "order", value: _ } <<< Deku.Attribute.prop'
