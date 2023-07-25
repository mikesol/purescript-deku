module Deku.DOM.Attr.Is where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Is = Is

instance Deku.Attribute.Attr everything Is Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "is", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Is String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "is", value: _ } <<< Deku.Attribute.prop'
