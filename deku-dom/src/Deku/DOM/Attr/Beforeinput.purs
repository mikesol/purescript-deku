module Deku.DOM.Attr.Beforeinput where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Beforeinput = Beforeinput

instance Deku.Attribute.Attr everything Beforeinput Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "beforeinput", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Beforeinput String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforeinput", value: _ } <<<
    Deku.Attribute.prop'
