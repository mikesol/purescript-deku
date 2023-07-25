module Deku.DOM.Attr.Canplay where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Canplay = Canplay

instance Deku.Attribute.Attr everything Canplay Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "canplay", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Canplay String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "canplay", value: _ } <<< Deku.Attribute.prop'
