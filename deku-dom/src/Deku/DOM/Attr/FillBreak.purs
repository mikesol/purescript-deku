module Deku.DOM.Attr.FillBreak where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillBreak = FillBreak

instance Deku.Attribute.Attr everything FillBreak Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-break", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillBreak String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-break", value: _ } <<<
    Deku.Attribute.prop'
