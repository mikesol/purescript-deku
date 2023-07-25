module Deku.DOM.Attr.Ratechange where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Ratechange = Ratechange

instance Deku.Attribute.Attr everything Ratechange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ratechange", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Ratechange String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ratechange", value: _ } <<<
    Deku.Attribute.prop'
