module Deku.DOM.Attr.From where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data From = From

instance Deku.Attribute.Attr everything From Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "from", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ From String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "from", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ From String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "from", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ From String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "from", value: _ } <<< Deku.Attribute.prop'
