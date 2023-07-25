module Deku.DOM.Attr.StartOffset where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.TextPath (TextPath_)

data StartOffset = StartOffset

instance Deku.Attribute.Attr everything StartOffset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "startOffset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr TextPath_ StartOffset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "startOffset", value: _ } <<<
    Deku.Attribute.prop'
