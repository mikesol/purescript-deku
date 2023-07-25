module Deku.DOM.Attr.Dblclick where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dblclick = Dblclick

instance Deku.Attribute.Attr everything Dblclick Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dblclick", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dblclick String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dblclick", value: _ } <<< Deku.Attribute.prop'
