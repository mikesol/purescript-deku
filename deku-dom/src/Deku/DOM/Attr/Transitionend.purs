module Deku.DOM.Attr.Transitionend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Transitionend = Transitionend

instance Deku.Attribute.Attr everything Transitionend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "transitionend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Transitionend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitionend", value: _ } <<<
    Deku.Attribute.prop'
