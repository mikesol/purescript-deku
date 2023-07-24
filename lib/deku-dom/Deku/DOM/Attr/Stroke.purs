module Deku.DOM.Attr.Stroke where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Stroke = Stroke

instance Deku.Attribute.Attr everything Stroke Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Stroke String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke", value: _ } <<< Deku.Attribute.prop'
