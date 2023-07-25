module Deku.DOM.Attr.Timeupdate where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Timeupdate = Timeupdate

instance Deku.Attribute.Attr everything Timeupdate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "timeupdate", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Timeupdate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "timeupdate", value: _ } <<<
    Deku.Attribute.prop'
