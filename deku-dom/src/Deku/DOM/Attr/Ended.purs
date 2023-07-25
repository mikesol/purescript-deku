module Deku.DOM.Attr.Ended where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Ended = Ended

instance Deku.Attribute.Attr everything Ended Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ended", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Ended String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ended", value: _ } <<< Deku.Attribute.prop'
