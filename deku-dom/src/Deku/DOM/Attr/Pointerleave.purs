module Deku.DOM.Attr.Pointerleave where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointerleave = Pointerleave

instance Deku.Attribute.Attr everything Pointerleave Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerleave", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointerleave String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerleave", value: _ } <<<
    Deku.Attribute.prop'