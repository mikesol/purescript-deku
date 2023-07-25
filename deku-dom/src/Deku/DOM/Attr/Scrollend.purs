module Deku.DOM.Attr.Scrollend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Scrollend = Scrollend

instance Deku.Attribute.Attr everything Scrollend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scrollend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Scrollend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scrollend", value: _ } <<<
    Deku.Attribute.prop'
