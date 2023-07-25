module Deku.DOM.Attr.Origin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data Origin = Origin

instance Deku.Attribute.Attr everything Origin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "origin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Origin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "origin", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Origin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "origin", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Origin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "origin", value: _ } <<< Deku.Attribute.prop'
