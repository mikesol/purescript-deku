module Deku.DOM.Attr.Mouseover where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mouseover = Mouseover

instance Deku.Attribute.Attr everything Mouseover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mouseover", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mouseover String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseover", value: _ } <<<
    Deku.Attribute.prop'
