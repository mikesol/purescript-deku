module Deku.DOM.Attr.Play where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Play = Play

instance Deku.Attribute.Attr everything Play Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "play", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Play String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "play", value: _ } <<< Deku.Attribute.prop'
