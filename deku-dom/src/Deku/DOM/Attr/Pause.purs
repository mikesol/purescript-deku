module Deku.DOM.Attr.Pause where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pause = Pause

instance Deku.Attribute.Attr everything Pause Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pause", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pause String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pause", value: _ } <<< Deku.Attribute.prop'
