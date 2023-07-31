module Deku.DOM.Attr.Behavior where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Marquee (Marquee_)

data Behavior = Behavior

instance Deku.Attribute.Attr everything Behavior Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "behavior", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marquee_ Behavior String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "behavior", value: _ } <<< Deku.Attribute.prop'
