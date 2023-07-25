module Deku.DOM.Attr.Seeked where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Seeked = Seeked

instance Deku.Attribute.Attr everything Seeked Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "seeked", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Seeked String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "seeked", value: _ } <<< Deku.Attribute.prop'
