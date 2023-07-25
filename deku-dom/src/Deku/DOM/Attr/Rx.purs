module Deku.DOM.Attr.Rx where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Rx = Rx

instance Deku.Attribute.Attr everything Rx Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rx", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Rx String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rx", value: _ } <<< Deku.Attribute.prop'
