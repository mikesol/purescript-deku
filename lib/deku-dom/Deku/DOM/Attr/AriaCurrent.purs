module Deku.DOM.Attr.AriaCurrent where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaCurrent = AriaCurrent

instance Deku.Attribute.Attr everything AriaCurrent Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-current", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaCurrent String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-current", value: _ } <<<
    Deku.Attribute.prop'
