module Deku.DOM.Attr.Bias where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data Bias = Bias

instance Deku.Attribute.Attr everything Bias Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "bias", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ Bias String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bias", value: _ } <<< Deku.Attribute.prop'
