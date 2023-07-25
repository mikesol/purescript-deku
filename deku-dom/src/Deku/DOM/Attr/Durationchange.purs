module Deku.DOM.Attr.Durationchange where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Durationchange = Durationchange

instance Deku.Attribute.Attr everything Durationchange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "durationchange", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Durationchange String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "durationchange", value: _ } <<<
    Deku.Attribute.prop'
