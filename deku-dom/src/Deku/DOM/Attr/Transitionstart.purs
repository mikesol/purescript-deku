module Deku.DOM.Attr.Transitionstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Transitionstart = Transitionstart

instance Deku.Attribute.Attr everything Transitionstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "transitionstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Transitionstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitionstart", value: _ } <<<
    Deku.Attribute.prop'
