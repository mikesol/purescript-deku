module Deku.DOM.Attr.LengthAdjust where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)

data LengthAdjust = LengthAdjust

instance Deku.Attribute.Attr everything LengthAdjust Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "lengthAdjust", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ LengthAdjust String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lengthAdjust", value: _ } <<<
    Deku.Attribute.prop'
