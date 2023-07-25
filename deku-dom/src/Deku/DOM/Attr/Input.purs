module Deku.DOM.Attr.Input where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Input = Input

instance Deku.Attribute.Attr everything Input Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "input", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Input String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "input", value: _ } <<< Deku.Attribute.prop'
