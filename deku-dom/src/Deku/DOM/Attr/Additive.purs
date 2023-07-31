module Deku.DOM.Attr.Additive where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data Additive = Additive

instance Deku.Attribute.Attr everything Additive Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "additive", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Additive String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "additive", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Additive String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "additive", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Additive String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "additive", value: _ } <<< Deku.Attribute.prop'
