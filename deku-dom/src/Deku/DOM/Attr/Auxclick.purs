module Deku.DOM.Attr.Auxclick where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Auxclick = Auxclick

instance Deku.Attribute.Attr everything Auxclick Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "auxclick", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Auxclick String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "auxclick", value: _ } <<< Deku.Attribute.prop'
