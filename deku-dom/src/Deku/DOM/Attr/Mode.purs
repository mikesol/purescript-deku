module Deku.DOM.Attr.Mode where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeBlend (FeBlend_)

data Mode = Mode

instance Deku.Attribute.Attr everything Mode Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mode", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeBlend_ Mode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mode", value: _ } <<< Deku.Attribute.prop'
