module Deku.DOM.Attr.Begin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data Begin = Begin

instance Deku.Attribute.Attr everything Begin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "begin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Begin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "begin", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Begin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "begin", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Begin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "begin", value: _ } <<< Deku.Attribute.prop'
