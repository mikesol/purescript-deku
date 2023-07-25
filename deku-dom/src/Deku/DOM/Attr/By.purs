module Deku.DOM.Attr.By where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data By = By

instance Deku.Attribute.Attr everything By Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "by", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ By String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "by", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ By String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "by", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ By String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "by", value: _ } <<< Deku.Attribute.prop'
