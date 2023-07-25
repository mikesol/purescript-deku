module Deku.DOM.Attr.Load where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Load = Load

instance Deku.Attribute.Attr everything Load Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "load", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Load String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "load", value: _ } <<< Deku.Attribute.prop'
