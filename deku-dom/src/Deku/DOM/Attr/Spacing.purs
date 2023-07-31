module Deku.DOM.Attr.Spacing where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.TextPath (TextPath_)

data Spacing = Spacing

instance Deku.Attribute.Attr everything Spacing Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "spacing", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr TextPath_ Spacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "spacing", value: _ } <<< Deku.Attribute.prop'
