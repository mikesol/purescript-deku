module Deku.DOM.Attr.Capture where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Input (Input_)

data Capture = Capture

instance Deku.Attribute.Attr everything Capture Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "capture", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Capture String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "capture", value: _ } <<< Deku.Attribute.prop'
