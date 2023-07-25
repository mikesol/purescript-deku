module Deku.DOM.Attr.Transitionrun where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Transitionrun = Transitionrun

instance Deku.Attribute.Attr everything Transitionrun Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "transitionrun", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Transitionrun String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitionrun", value: _ } <<<
    Deku.Attribute.prop'
