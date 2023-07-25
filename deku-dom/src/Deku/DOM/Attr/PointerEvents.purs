module Deku.DOM.Attr.PointerEvents where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data PointerEvents = PointerEvents

instance Deku.Attribute.Attr everything PointerEvents Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointer-events", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything PointerEvents String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointer-events", value: _ } <<<
    Deku.Attribute.prop'
