module Deku.DOM.Attr.Dur where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data Dur = Dur

instance Deku.Attribute.Attr everything Dur Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dur", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Dur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dur", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Dur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dur", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Dur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dur", value: _ } <<< Deku.Attribute.prop'
