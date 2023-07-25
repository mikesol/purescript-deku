module Deku.DOM.Attr.Webkittransitionend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Webkittransitionend = Webkittransitionend

instance Deku.Attribute.Attr everything Webkittransitionend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "webkittransitionend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Webkittransitionend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "webkittransitionend", value: _ } <<<
    Deku.Attribute.prop'
