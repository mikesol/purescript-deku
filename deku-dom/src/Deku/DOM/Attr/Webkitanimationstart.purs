module Deku.DOM.Attr.Webkitanimationstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Webkitanimationstart = Webkitanimationstart

instance Deku.Attribute.Attr everything Webkitanimationstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "webkitanimationstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Webkitanimationstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "webkitanimationstart", value: _ } <<<
    Deku.Attribute.prop'
