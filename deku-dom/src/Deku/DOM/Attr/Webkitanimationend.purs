module Deku.DOM.Attr.Webkitanimationend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Webkitanimationend = Webkitanimationend

instance Deku.Attribute.Attr everything Webkitanimationend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "webkitanimationend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Webkitanimationend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "webkitanimationend", value: _ } <<<
    Deku.Attribute.prop'
