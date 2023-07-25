module Deku.DOM.Attr.Blur where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Blur = Blur

instance Deku.Attribute.Attr everything Blur Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "blur", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Blur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "blur", value: _ } <<< Deku.Attribute.prop'
