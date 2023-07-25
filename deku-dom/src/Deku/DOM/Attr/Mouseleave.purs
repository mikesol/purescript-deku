module Deku.DOM.Attr.Mouseleave where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mouseleave = Mouseleave

instance Deku.Attribute.Attr everything Mouseleave Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mouseleave", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mouseleave String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseleave", value: _ } <<<
    Deku.Attribute.prop'
