module Deku.DOM.Attr.Optimum where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Meter (Meter_)

data Optimum = Optimum

instance Deku.Attribute.Attr everything Optimum Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "optimum", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Meter_ Optimum String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "optimum", value: _ } <<< Deku.Attribute.prop'
