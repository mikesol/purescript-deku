module Deku.DOM.Attr.Loadeddata where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Loadeddata = Loadeddata

instance Deku.Attribute.Attr everything Loadeddata Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "loadeddata", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Loadeddata String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loadeddata", value: _ } <<<
    Deku.Attribute.prop'
