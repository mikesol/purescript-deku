module Deku.DOM.Attr.AriaLive where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaLive = AriaLive

instance Deku.Attribute.Attr everything AriaLive Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-live", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaLive String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-live", value: _ } <<<
    Deku.Attribute.prop'
