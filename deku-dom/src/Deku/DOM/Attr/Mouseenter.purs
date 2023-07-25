module Deku.DOM.Attr.Mouseenter where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mouseenter = Mouseenter

instance Deku.Attribute.Attr everything Mouseenter Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mouseenter", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mouseenter String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseenter", value: _ } <<<
    Deku.Attribute.prop'
