module Deku.DOM.Attr.KeyTimes where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data KeyTimes = KeyTimes

instance Deku.Attribute.Attr everything KeyTimes Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keyTimes", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ KeyTimes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyTimes", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ KeyTimes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyTimes", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ KeyTimes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyTimes", value: _ } <<< Deku.Attribute.prop'
