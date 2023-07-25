module Deku.DOM.Attr.InlineSize where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data InlineSize = InlineSize

instance Deku.Attribute.Attr everything InlineSize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "inline-size", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything InlineSize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "inline-size", value: _ } <<<
    Deku.Attribute.prop'
