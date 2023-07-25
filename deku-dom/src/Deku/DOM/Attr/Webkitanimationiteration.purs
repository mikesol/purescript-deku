module Deku.DOM.Attr.Webkitanimationiteration where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Webkitanimationiteration = Webkitanimationiteration

instance Deku.Attribute.Attr everything Webkitanimationiteration Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "webkitanimationiteration", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Webkitanimationiteration String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "webkitanimationiteration", value: _ } <<<
    Deku.Attribute.prop'
