module Deku.DOM.Attr.Waiting where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Waiting = Waiting

instance Deku.Attribute.Attr everything Waiting Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "waiting", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Waiting String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "waiting", value: _ } <<< Deku.Attribute.prop'
