module Deku.DOM.Attr.Beforematch where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Beforematch = Beforematch

instance Deku.Attribute.Attr everything Beforematch Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "beforematch", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Beforematch String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforematch", value: _ } <<<
    Deku.Attribute.prop'
