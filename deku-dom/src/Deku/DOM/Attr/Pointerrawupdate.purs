module Deku.DOM.Attr.Pointerrawupdate where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointerrawupdate = Pointerrawupdate

instance Deku.Attribute.Attr everything Pointerrawupdate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "pointerrawupdate", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointerrawupdate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerrawupdate", value: _ } <<<
    Deku.Attribute.prop'
