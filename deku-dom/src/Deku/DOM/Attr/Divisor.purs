module Deku.DOM.Attr.Divisor where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data Divisor = Divisor

instance Deku.Attribute.Attr everything Divisor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "divisor", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ Divisor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "divisor", value: _ } <<< Deku.Attribute.prop'
